import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/students/getStudentRankViewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';
import '../../data/model/studentModel.dart';

abstract class StudentController extends GetxController {
  getData(String studentId);
  initData();
}

class StudentControllerImp extends StudentController {
  GetStudentRankViewData getStudentRankViewData =
      GetStudentRankViewData(Get.find());

  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  late String studentId;
  String className = "";
  String rank = "0";
  String studentName = "";

  @override
  getData(String studentId) async {
    statusRequest = StatusRequest.loading;

    update();

    var response = await getStudentRankViewData.getstudentRankData(studentId);
    print(response);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        className = response['data']['class_name'];
        rank = response['data']['rank'];
        studentName = response['data']['full_name'];
        print(" your rank is : $rank");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    print("I am here in studentController ");
    // get the user id
    studentId = myServices.sharedPreferences.getString("student_id")!;
    print("student id is: $studentId");
    getData(studentId);
  }
}
