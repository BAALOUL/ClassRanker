import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_store/data/remote/providers/providerPhotoUpdateData.dart';
import 'package:ecommerce_store/data/remote/serviceProvider/serviceProviderUpdate.dart';
import 'package:ecommerce_store/data/remote/services/sectionsAndServicesViewData.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/consColors.dart';
import '../../../../core/functions/handingDataController.dart';
import '../../../../core/services/services.dart';
import '../../../../data/remote/providers/providerDetailViewData.dart';
import '../../../../data/remote/providers/providerUpdateData.dart';
import '../../../../data/remote/serviceProvider/selectServicesByProviderData.dart';
import '../../../../links.dart';
import '../../../../view/widgets/auth/customButton.dart';
import '../../../../view/widgets/titleCustomBig.dart';

abstract class ImageHandler extends GetxController {
  initData();
}

class ImageHandlerImp extends ImageHandler {
  FirstRowControllerImp firstRowController = Get.find();

  MyServices myServices = Get.find();

  late final String providerId;
  final RxString providerPhotoUrl = ''.obs;
  final Rx<File?> providerImage = Rx<File?>(null);

  ProviderUpdateData providerUpdateData = ProviderUpdateData(Get.find());

  Future<void> photoUpdate() async {
    var statusRequest = StatusRequest.loading;
    print("Status Request : $statusRequest");
    var file = providerImage.value;
    if (file != null) {
      var stream = http.ByteStream(file.openRead());
      var length = await file.length();
      var uri = Uri.parse(Links.providersPhotoUpdate);

      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile(
        'provider_image',
        stream,
        length,
        filename: file.path.split("/").last,
      );
      request.files.add(multipartFile);

      // Add provider_id field to the request
      request.fields['provider_id'] = providerId;

      var response = await request.send();

      if (response.statusCode == 200) {
        statusRequest = handingData(response);
        if (StatusRequest.success == statusRequest) {
          // String imageName = file.path.split("/").last;
          firstRowController.initData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // Handle the case when the server returns a non-200 status code
      }
    }
    update();
    print("Status Request : $statusRequest");
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    providerId = myServices.sharedPreferences.get('providerId').toString();
  }
}
