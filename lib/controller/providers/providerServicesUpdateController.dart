import 'dart:convert';
import 'package:ecommerce_store/data/remote/serviceProvider/serviceProviderUpdate.dart';
import 'package:ecommerce_store/data/remote/services/sectionsAndServicesViewData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';
import '../../core/services/services.dart';
import '../../data/remote/providers/providerDetailViewData.dart';
import '../../data/remote/providers/providerUpdateData.dart';
import '../../data/remote/serviceProvider/selectServicesByProviderData.dart';

abstract class ProviderServicesUpdateController extends GetxController {
  initData();
  fetchSectionsAndServices();
  getServicesByProvider(String prov);
  saveProviderServices();
}

class ProviderInformation {
  final List<Section> sections;

  ProviderInformation({
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

class ProviderServicesUpdateControllerImp
    extends ProviderServicesUpdateController {
  MyServices myServices = Get.find();
  late String userId;
  late String providerId;
  late List servicesByProvider = [];

  final RxList<Section> sections = <Section>[].obs;
  final RxList<Service> selectedServices = <Service>[].obs;

  ProviderByIDViewData providerByIDViewData = ProviderByIDViewData(Get.find());

  SectionsAndServicesViewData sectionsServicesView =
      SectionsAndServicesViewData(Get.find());

  ProviderUpdateData providerUpdateData = ProviderUpdateData(Get.find());

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
        return;
      }
    }
    service.isSelected.toggle();
    //validateForm();
    update();
  }

  @override
  void saveProviderServices() async {
    statusRequest = StatusRequest.loading;
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
        Get.snackbar(
          "Services Update",
          "The services have been updated successfully",
          backgroundColor: Colors.lime,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

    /* final ProviderInformation providerInformation = ProviderInformation(
      nameAr: nameAr,
      name: name,
      whatsapp: whatsapp,
      website: website,
      sections: sections.toList(),
    );*/
  }

  @override
  initData() {
    userId = myServices.sharedPreferences.get('userId').toString();

    providerId = myServices.sharedPreferences.get('providerId').toString();
    print("step1 provId : $providerId and user  $userId");
    getServicesByProvider(providerId);
    print("step2 get services :");
    fetchSectionsAndServices();
    print("step3 fetch services : ");
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



/*
import 'dart:convert';
import 'package:ecommerce_store/data/remote/serviceProvider/serviceProviderUpdate.dart';
import 'package:ecommerce_store/data/remote/services/sectionsAndServicesViewData.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';
import '../../core/services/services.dart';
import '../../data/remote/providers/providerDetailViewData.dart';
import '../../data/remote/providers/providerUpdateData.dart';
import '../../data/remote/serviceProvider/selectServicesByProviderData.dart';

abstract class ProviderInformationController extends GetxController {
  initData();
  fetchSectionsAndServices();
  getServicesByProvider(String prov);
  saveProviderServices();
}

class ProviderInformation {
  final String nameAr;
  final String name;
  final String whatsapp;
  final String website;
  final List<Section> sections;

  ProviderInformation({
    required this.nameAr,
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

  ProviderByIDViewData providerByIDViewData = ProviderByIDViewData(Get.find());

  SectionsAndServicesViewData sectionsServicesView =
      SectionsAndServicesViewData(Get.find());

  ProviderUpdateData providerUpdateData = ProviderUpdateData(Get.find());

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
        return;
      }
    }
    service.isSelected.toggle();
    //validateForm();
    update();
  }

  @override
  void saveProviderServices() async {
    statusRequest = StatusRequest.loading;
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

    /* final ProviderInformation providerInformation = ProviderInformation(
      nameAr: nameAr,
      name: name,
      whatsapp: whatsapp,
      website: website,
      sections: sections.toList(),
    );*/
  }

  @override
  initData() {
    userId = myServices.sharedPreferences.get('userId').toString();

    providerId = myServices.sharedPreferences.get('providerId').toString();
    print("step1 provId : $providerId and user  $userId");
    getServicesByProvider(providerId);
    print("step2 get services :");
    fetchSectionsAndServices();
    print("step3 fetch services : ");
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
*/