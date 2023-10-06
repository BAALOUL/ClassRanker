import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/data/remote/students/deleteStudentViewData.dart';
import 'package:get/get.dart';

import '../../data/model/studentModel.dart';

abstract class StudentDetailController extends GetxController {
  initData();
  goToStudentEdit(StudentModel studentModel);
}

class StudentDetailControllerImp extends StudentDetailController {
  DeleteStudentViewData deleteStudentViewData =
      DeleteStudentViewData(Get.find());
  late StatusRequest statusRequest;

  late StudentModel studentModel;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    final studentModel = Get.arguments?["student_model"] as StudentModel?;
    if (studentModel != null) {
      print("id is : ${studentModel.studentid}");
      print("detail controller init");
      print(studentModel.fullname);
      // Assign the studentModel to the controller's property
      this.studentModel = studentModel;
      update();
    } else {
      // Handle the case when the argument is null
      print("student_model argument is null");
    }
  }

  @override
  void goToStudentEdit(StudentModel studentModel) {
    Get.toNamed(
      ConsRoutes.editStudentScreen,
      arguments: {"student_model": studentModel},
    );
  }

  Future<void> deleteStudent(String studentId) async {
    final response =
        await deleteStudentViewData.deleteStudentViewData(studentId);
    print(studentId);
    print(response);
    if (response == "success") {
    } else {
      // Handle error or display a message
    }
  }
}
