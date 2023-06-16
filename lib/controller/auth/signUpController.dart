import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/auth/signupUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  login();
  toSignIn();
  signUp();
}

class SinUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  SignupUser signupuser = SignupUser(Get.find());
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest? statusRequest;

  List data = [];

  @override
  login() {}

  @override
  toSignIn() {
    Get.toNamed(ConsRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      //print(username);
      var response = await signupuser.postuser(
          username.text, password.text, email.text, phone.text);
      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(ConsRoutes.verefyCode, arguments: {"email": email.text});
          //Get.offNamed(ConsRoutes.verefyCode);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }
}
