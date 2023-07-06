import 'package:ecommerce_store/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handingDataController.dart';
import '../../../../data/remote/providers/providerDetailViewData.dart';
import '../../../../data/remote/providers/providerUpdateData.dart';

abstract class ProviderInfosController extends GetxController {
  initData();
  saveProviderInformation();
  getProviderById(String prov);
  savePersonalInformations(String provId, String name, String nameAr,
      String whatsapp, String website);
}

class ProviderInformation {
  final String nameAr;
  final String name;
  final String whatsapp;
  final String website;

  ProviderInformation({
    required this.nameAr,
    required this.name,
    required this.whatsapp,
    required this.website,
  });
}

class ProviderInfosControllerImp extends ProviderInfosController {
  MyServices myServices = Get.find();
  ProviderUpdateData providerUpdateData = ProviderUpdateData(Get.find());
  ProviderByIDViewData providerByIDViewData = ProviderByIDViewData(Get.find());

  late String providerId;
  late String providerImg;

  late StatusRequest statusRequest;

  final TextEditingController nameController;
  final TextEditingController nameArController;
  final TextEditingController whatsappController;
  final TextEditingController websiteController;

  final RxBool isFormValid = false.obs;
  final RxBool showErrorMessage = false.obs;

  ProviderInfosControllerImp()
      : nameController = TextEditingController(),
        nameArController = TextEditingController(),
        whatsappController = TextEditingController(),
        websiteController = TextEditingController();

  void validateForm() {
    final nameAr = nameArController.text.trim();
    final name = nameController.text.trim();
    final whatsapp = whatsappController.text.trim();
    final website = websiteController.text.trim();

    final isNameValid = name.isNotEmpty;
    final isNameArValid = nameAr.isNotEmpty;
    final isWhatsAppValid = whatsapp.isNotEmpty;
    final isWebsiteValid = website.isNotEmpty;
    // final areServicesValid = selectedServices.isNotEmpty;

    isFormValid.value =
        isNameValid && isWhatsAppValid && isWebsiteValid && isNameArValid;
  }

  @override
  void saveProviderInformation() async {
    final String nameAr = nameArController.text.trim();
    final String name = nameController.text.trim();
    final String whatsapp = whatsappController.text.trim();
    final String website = websiteController.text.trim();

    print("name : $nameAr whatsapp: $whatsapp");

    if (name.isEmpty || whatsapp.isEmpty || website.isEmpty) {
      showErrorMessage.value = true;
      return;
    }

    savePersonalInformations(providerId, name, nameAr, whatsapp, website);
  }

  @override
  savePersonalInformations(provId, name, nameAr, whatsapp, website) async {
    statusRequest = StatusRequest.loading;
    var response = await providerUpdateData.postProviderUpdateData(
        provId, name, nameAr, whatsapp, website);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Informations saved", "thanks");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    nameArController.dispose();
    nameController.dispose();
    whatsappController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  initData() async {
    providerId = myServices.sharedPreferences.get('providerId').toString();
    print("step4 provId : $providerId");
    await getProviderById(providerId);
    print("step5 getProviderId...");

    print(
        " step 6  ********* ${nameController.text}    ${nameArController.text}   *********");
    update();
  }

  @override
  getProviderById(prov) async {
    statusRequest = StatusRequest.loading;
    var response = await providerByIDViewData.getProviderDetailViewData(prov);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var providerData = response['data'][0];
        // Set the values of the text fields
        nameController.text = providerData['provider_name'];
        nameArController.text = providerData['provider_name_ar'];
        websiteController.text = providerData['provider_website'];
        whatsappController.text = providerData['provider_whatsapp'];
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  @override
  void onInit() {
    super.onInit();
    initData();
  }
}
