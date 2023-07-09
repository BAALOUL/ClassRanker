import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/remote/providers/providerCreateData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handingDataController.dart';
import '../../../../data/remote/providers/providerDetailViewData.dart';
import '../../../../data/remote/providers/providerUpdateData.dart';

abstract class ProviderInfosCreatController extends GetxController {
  initData();
  createProvider();
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

class ProviderInfosCreatControllerImp extends ProviderInfosCreatController {
  MyServices myServices = Get.find();
  ProviderCreateData providerCreateData = ProviderCreateData(Get.find());

  late String userId;

  late StatusRequest statusRequest = StatusRequest.none;

  final TextEditingController nameController;
  final TextEditingController nameArController;
  final TextEditingController whatsappController;
  final TextEditingController websiteController;

  final RxBool isFormValid = false.obs;
  final RxBool showErrorMessage = false.obs;

  ProviderInfosCreatControllerImp()
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
  Future<void> createProvider() async {
    final String nameAr = nameArController.text.trim();
    final String name = nameController.text.trim();
    final String whatsapp = whatsappController.text.trim();
    final String website = websiteController.text.trim();

    if (name.isEmpty || whatsapp.isEmpty || website.isEmpty) {
      showErrorMessage.value = true;
      return;
    }

    print("user : $userId  name: $name whatsapp: $whatsapp");

    savePersonalInformations(userId, name, nameAr, whatsapp, website);
  }

  @override
  savePersonalInformations(userId, name, nameAr, whatsapp, website) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await providerCreateData.postProviderCreateData(
        userId, name, nameAr, whatsapp, website);
    print(" response from provider create is:     $response");
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences
            .setString("providerId", response['provId']);
        print("---------- provider Id is : ${response['provId']} +++++++++++");
        String pro = myServices.sharedPreferences.get('providerId').toString();
        print("the saved provider is : $pro");
        myServices.sharedPreferences.setString("mode", "providerMode");
        Get.snackbar("Account created",
            "The provider with personal informations is successfuly created \n Go to the next step please");
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
    userId = myServices.sharedPreferences.get('userId').toString();

    print(" step 6  ********* $userId   ${nameArController.text}   *********");
    update();
  }

  @override
  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
