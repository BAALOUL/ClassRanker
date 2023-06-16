import 'dart:convert';

import 'package:ecommerce_store/data/remote/serviceProvider/serviceProviderUpdate.dart';
import 'package:ecommerce_store/data/remote/services/sectionsAndServicesViewData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';
import '../../core/services/services.dart';
import '../../data/remote/serviceProvider/selectServicesByProviderData.dart';

abstract class ProviderInformationController extends GetxController {
  initData();
  saveProviderInformation();
  fetchSectionsAndServices();
  getServicesByProvider(String prov);
}

class ProviderInformation {
  final String name;
  final String whatsapp;
  final String website;
  final List<Section> sections;

  ProviderInformation({
    required this.name,
    required this.whatsapp,
    required this.website,
    required this.sections,
  });
}

class Section {
  final String sectionName;
  final List<Service> services;

  Section({required this.sectionName, required this.services});
}

class Service {
  final String serviceid;
  final String servicename;
  RxBool isSelected;

  Service({
    required this.serviceid,
    required this.servicename,
    bool isSelected = false,
  }) : isSelected = isSelected.obs;
}

class ProviderInformationControllerImp extends ProviderInformationController {
  MyServices myServices = Get.find();
  late String userId;
  late String providerId;
  late List servicesByProvider = [];

  final RxList<Section> sections = <Section>[].obs;
  final RxList<Service> selectedServices = <Service>[].obs;

  final TextEditingController nameController;
  final TextEditingController whatsappController;
  final TextEditingController websiteController;

  final RxBool isFormValid = false.obs;
  final RxBool showErrorMessage = false.obs;

  ProviderInformationControllerImp()
      : nameController = TextEditingController(),
        whatsappController = TextEditingController(),
        websiteController = TextEditingController();

  SectionsAndServicesViewData sectionsServicesView =
      SectionsAndServicesViewData(Get.find());

  ServiceProviderUpdateData serviceProviderUpdateData =
      ServiceProviderUpdateData(Get.find());

  SelectServicesByProvider selectServicesByProvider =
      SelectServicesByProvider(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initData();

    super.onInit();
  }

  @override
  void fetchSectionsAndServices() async {
    statusRequest = StatusRequest.loading;
    var response = await sectionsServicesView.getSectionsAndServicesData();

    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response != null && response['status'] == "success") {
        List<dynamic>? sectionsData = response['data'];
        if (sectionsData != null) {
          List<Section> fetchedSections = [];
          for (var sectionData in sectionsData) {
            if (sectionData.containsKey('services')) {
              String servicesDataString = sectionData['services'];
              List<dynamic> servicesData = json.decode(servicesDataString);
              if (servicesData is List<dynamic>) {
                List<Service> services = servicesData.map((serviceData) {
                  String serviceId = serviceData['id'].toString();
                  String serviceName = serviceData['name'];
                  bool isSelected = servicesByProvider.contains(serviceId);
                  return Service(
                    serviceid: serviceId,
                    servicename: serviceName,
                    isSelected: isSelected,
                  );
                }).toList();

                fetchedSections.add(
                  Section(
                    sectionName: sectionData['name'],
                    services: services,
                  ),
                );
              }
            }
          }
          sections.assignAll(fetchedSections);
          update(); // Trigger an update to refresh the screen
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update(); // Trigger an update to refresh the screen
  }

  void selectService(Service service) {
    if (service.isSelected.value) {
      selectedServices.remove(service);
    } else {
      if (selectedServices.length < 3) {
        selectedServices.add(service);
      } else {
        showErrorMessage.value = true;
        return;
      }
    }
    service.isSelected.toggle();
    validateForm();
    update();
  }

  void validateForm() {
    final name = nameController.text.trim();
    final whatsapp = whatsappController.text.trim();
    final website = websiteController.text.trim();

    final isNameValid = name.isNotEmpty;
    final isWhatsAppValid = whatsapp.isNotEmpty;
    final isWebsiteValid = website.isNotEmpty;
    final areServicesValid = selectedServices.isNotEmpty;

    isFormValid.value =
        isNameValid && isWhatsAppValid && isWebsiteValid && areServicesValid;
  }

  @override
  void saveProviderInformation() async {
    final String name = nameController.text.trim();
    final String whatsapp = whatsappController.text.trim();
    final String website = websiteController.text.trim();

    if (name.isEmpty || whatsapp.isEmpty || website.isEmpty) {
      showErrorMessage.value = true;
      return;
    }

    statusRequest = StatusRequest.loading;
    update();
    //print(username);
    String slectServices = selectedServices
        .map((service) => service.serviceid)
        .toList()
        .toString();

    //print('Selected Services ****: $slectServices');
    var response = await serviceProviderUpdateData
        .postServiceProviderUpdateDataUpdate(providerId, slectServices);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

    final ProviderInformation providerInformation = ProviderInformation(
      name: name,
      whatsapp: whatsapp,
      website: website,
      sections: sections.toList(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    whatsappController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  initData() {
    userId = myServices.sharedPreferences.get('userId').toString();

    providerId = myServices.sharedPreferences.get('providerId').toString();
    getServicesByProvider(providerId);
    fetchSectionsAndServices();
  }

  @override
  getServicesByProvider(prov) async {
    statusRequest = StatusRequest.loading;
    var response =
        await selectServicesByProvider.getSelectServicesByProviderData(prov);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        servicesByProvider = response['data'] ?? [];
        // print('the 3 services by $providerId are: $servicesByProvider');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}




 //if he is not connected as user firstly add him as user
  //then take the userId and add him as provider
  //update its services: if he is new provider the selected services will be add to the service_provider table
  //else if he is already exist the services will be added with status active otherwise with inactive.

  // Perform your desired action with the provider information (e.g., save to database)
  /*print('Provider Name: ${providerInformation.name}');
    print('WhatsApp: ${providerInformation.whatsapp}');
    print('Website: ${providerInformation.website}');
    print(
        'Selected Services: ${selectedServices.map((service) => service.service_id).toList()}');
        */

