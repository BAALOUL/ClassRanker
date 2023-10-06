import 'package:classRanker/data/remote/students/updateStudentViewData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';
import '../../data/model/studentModel.dart';

abstract class EditStudentController extends GetxController {
  initData();
  editStudentData();
}

class EditStudentControllerImp extends EditStudentController {
  UpdateStudentData updateStudentData = UpdateStudentData(Get.find());

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final classNameController = TextEditingController();
  final rankController = TextEditingController();
  final gradeController = TextEditingController();
  final attendanceController = TextEditingController();

  late StudentModel studentModel;
  late String studentId;
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
    gradeController.dispose();
    attendanceController.dispose();
    super.onClose();
  }

  @override
  initData() {
    studentModel = Get.arguments['student_model'];
    // Populate the text controllers with studentModel data
    print("init edit st, the id is: ${studentModel.studentid}");
    studentId = studentModel.studentid!;
    fullNameController.text = studentModel.fullname ?? '';
    classNameController.text = studentModel.classname ?? '';
    rankController.text = studentModel.rank ?? '';
    gradeController.text = studentModel.grade ?? '';
    attendanceController.text = studentModel.attendance?.toString() ?? '';
    update();
  }

  // Implement the logic to update the student data here
  @override
  void editStudentData() async {
    statusRequest = StatusRequest.loading;
    if (formKey.currentState!.validate()) {
      // Valid form, proceed with updating the student data
      final fullName = fullNameController.text;
      final className = classNameController.text;
      final rank = int.parse(rankController.text);
      final grade = gradeController.text;
      final attendance = int.parse(attendanceController.text);

      if (studentModel != null) {
        // Check if studentModel is not null
        var response = await updateStudentData.postUpdateStudentData(
          studentModel.studentid ??
              "", // Use the null-aware operator ?? to provide a default value
          fullName,
          className,
          rank.toString(),
          grade,
          attendance.toString(),
        );

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
}
