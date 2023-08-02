import 'package:ecommerce_store/controller/auth/testController.dart';
import 'package:ecommerce_store/data/remote/auth/loginOtpData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusRequest.dart';
import '../../../core/functions/handingDataController.dart';
import '../../../core/services/services.dart';
import '../../../data/remote/providers/getProviderIdData.dart';
import '../../core/constant/consRoutes.dart';

abstract class LoginOTPController extends GetxController {
  getProviderId(String userId);
  login();
  sendOTP();
}

class LoginOTPControllerIMP extends GetxController
    implements LoginOTPController {
  TestController testController = Get.put(TestController());
  LoginOtpData loginOtpData = LoginOtpData(Get.find());
  GetProviderIdData getProviderIdData = GetProviderIdData(Get.find());

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode());

  MyServices myServices = Get.find();
  late String providerid = '';
  late String providerImg = '';
  String phoneNumber = '';
  String otp = '';

  StatusRequest? statusRequest;

  void getotp() {
    otp = '';
    for (TextEditingController controller in otpControllers) {
      otp += controller.text;
    }
    //print('OTP: $otp');
  }

  void moveToNextField(int currentIndex) {
    if (currentIndex < otpFocusNodes.length - 1) {
      FocusScope.of(Get.context!).requestFocus(otpFocusNodes[currentIndex + 1]);
    }
  }

  FocusNode getOtpFocusNode(int index) {
    return otpFocusNodes[index];
  }

  @override
  void onInit() {
    phoneNumber = Get.arguments['phone'];
    super.onInit();
  }

  @override
  Future<void> getProviderId(String userId) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await getProviderIdData.getProviderIdData(userId);
      statusRequest = handingData(response);
      print("step 2 initiat the shared");
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          providerid = response['data'][0]['provider_id'];
          providerImg = response['data'][0]['provider_image'];
          print("provider Id is : $providerid     loginOTP");
          await initShared(providerid);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } catch (e) {
      print("Error occurred in getProviderId: $e");
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  Future<void> initShared(String prov) async {
    if (prov != "") {
      myServices.sharedPreferences.setString("mode", "providerMode");
      myServices.sharedPreferences.setString("providerId", providerid);
      myServices.sharedPreferences.setString("providerImg", providerImg);
    } else {
      myServices.sharedPreferences.setString("mode", "userMode");
      myServices.sharedPreferences.setString("providerId", "");
      myServices.sharedPreferences.setString("providerImg", "");
    }
    String providerImgSh =
        myServices.sharedPreferences.get('providerImg').toString();

    print(
        " step 3 : the mode is : ${myServices.sharedPreferences.get('mode').toString()}");
    print(
        "provider Id : $providerid + and his photo is : $providerImg \n and the shared is : $providerImgSh \n-- in loginOTPController");
  }

  @override
  Future<void> login() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await loginOtpData.postuser(phoneNumber, otp);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      print("step 1 response : $response");
      if (response['status'] == "success") {
        registerUserInfos(response);

        await getProviderId(response['data']['id']);

        await initShared(providerid);
        testController.printToken('Hi Ali BAALOUL');
        Get.offNamed(ConsRoutes.homeProvider);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void registerUserInfos(response) {
    myServices.sharedPreferences.setString("userId", response['data']['id']);
    myServices.sharedPreferences
        .setString("username", response['data']['username']);
    myServices.sharedPreferences.setString("email", response['data']['email']);
    myServices.sharedPreferences.setString("phone", response['data']['phone']);
  }

  @override
  void sendOTP() {}

  TextEditingController getOtpController(int index) {
    return otpControllers[index];
  }
}
