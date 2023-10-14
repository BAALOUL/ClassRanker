import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/data/remote/students/getStudentsListData.dart';
import 'package:get/get.dart';

import '../../core/functions/handingDataController.dart';
import '../../data/model/studentsModel.dart';

abstract class GetStudentsListController extends GetxController {
  initData();
  getData();
}

class GetStudentsListControllerImp extends GetStudentsListController {
  GetStudentsListData getStudentsListData = GetStudentsListData(Get.find());

  late StatusRequest statusRequest;
  late StudentsModel studentsModel;
  List studentList = [];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    // Clear the previous data
    studentList.clear();
    update();

    try {
      var response = await getStudentsListData.getstudentListData();
      print(response);

      if (response != null && response['id'] != null) {
        statusRequest = StatusRequest.success;

        // Create a StudentsModel instance from the response
        final StudentsModel student = StudentsModel(
          id: response['id'],
        );

        // Add the student to the list
        studentList.add(student);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (error) {
      print("Error: $error");
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
