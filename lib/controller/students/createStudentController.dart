import 'package:classRanker/data/remote/students/updateStudentViewData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';
import '../../data/model/studentModel.dart';
import '../../data/remote/students/createStudentViewData.dart';

abstract class CreateStudentController extends GetxController {
  initData();
  createStudentData();
}

class CreateStudentControllerImp extends CreateStudentController {
  CreateStudentData createStudent = CreateStudentData(Get.find());

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final classNameController = TextEditingController();
  final rankController = TextEditingController();
  final gradeController = TextEditingController();
  final attendanceController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  late StudentModel studentModel;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    fullNameController.dispose();
    classNameController.dispose();
    rankController.dispose();
    super.onClose();
  }

  @override
  initData() {}

  // Implement the logic to update the student data here
  @override
  void createStudentData() async {
    statusRequest = StatusRequest.loading;
    if (formKey.currentState!.validate()) {
      // Valid form, proceed with updating the student data
      final username = usernameController.text;
      final password = classNameController.text;
      final fullName = fullNameController.text;
      final className = classNameController.text;
      final rank = int.parse(rankController.text);
      final grade = gradeController.text;
      final attendance = int.parse(attendanceController.text);
      final email = emailController.text;
      final phone = phoneController.text;
      var response = await createStudent.postCreateStudentData(
          username,
          password,
          fullName,
          className,
          rank.toString(),
          grade,
          attendance.toString(),
          email,
          phone);

      print(response);
      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      Get.back();
    }
  }
}
