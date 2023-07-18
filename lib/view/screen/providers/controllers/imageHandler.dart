import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handingDataController.dart';
import '../../../../core/services/services.dart';
import '../../../../data/remote/providers/providerUpdateData.dart';
import '../../../../links.dart';

abstract class ImageHandler extends GetxController {
  initData();
  goToServices();
}

class ImageHandlerImp extends ImageHandler {
  FirstRowControllerImp firstRowController = Get.find();

  MyServices myServices = Get.find();

  late String providerId;
  final RxString providerPhotoUrl = ''.obs;
  final Rx<File?> providerImage = Rx<File?>(null);

  ProviderUpdateData providerUpdateData = ProviderUpdateData(Get.find());

  ImageHandlerImp() {
    initData();
  }

  Future<void> photoUpdate(String opnedMod) async {
    var statusRequest = StatusRequest.loading;
    providerId = myServices.sharedPreferences.get('providerId').toString();

    update();

    print("S0 Request : $statusRequest and providerId is : $providerId");
    var file = providerImage.value;
    print("s1 file used : $file");
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
      print(
          "S1 filename : ${file.path.split("/").last}  \n the provider is : $providerId \n ");
      // Add provider_id field to the request
      request.fields['provider_id'] = providerId.toString();
      print("S2 ready to send : $request ");

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        //var parsedData = json.decode(responseData.split('}').first + '}');
        var parsedData = json.decode(responseData);
        print("the entire responseData is : $responseData");
        print("the name of image saved is : ${parsedData['provider_image']}");

        statusRequest = handingData(parsedData);
        if (StatusRequest.success == statusRequest) {
          String imageName =
              parsedData['provider_image'] ?? ''; // Retrieve the image name

          myServices.sharedPreferences.setString("providerImg", imageName);
          print("S3 success : $imageName ");
          //myServices.sharedPreferences.setString("providerImg", providerImg);
          firstRowController.initData();
          print("S5 finish ");
          Get.snackbar(
            "Image Update".tr,
            "The image has been updated successfully".tr,
            backgroundColor: Colors.lime,
            snackPosition: SnackPosition.BOTTOM,
          );
          if (opnedMod == "new") {
            Get.toNamed(ConsRoutes.providerServicesUpdateScreen);
          }
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
    print("from initial image Handler provider Id is :".tr + "$providerId");
    update();
  }

  @override
  goToServices() {
    Get.offAllNamed(ConsRoutes.providerServicesUpdateScreen);
  }
}
