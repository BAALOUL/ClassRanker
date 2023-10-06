import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/auth/signupUser.dart';
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
  late TextEditingController fullname;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest? statusRequest;

  List data = [];
  String role = "Student";

  @override
  login() {}

  @override
  toSignIn() {
    Get.toNamed(ConsRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    fullname = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    fullname.dispose();
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
      var response = await signupuser.postuser(username.text, fullname.text,
          password.text, email.text, phone.text, role);
      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(ConsRoutes.verefyCode,
              arguments: {"email": email.text, "role": role});
          //Get.offNamed(ConsRoutes.verefyCode);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  // Update the className when the selectedItem changes
  void updateRole(String selectedItem) {
    role = selectedItem;
    //getData(className);
  }
}
