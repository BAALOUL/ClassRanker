import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/students/selectStudentByIdViewData.dart';
import 'package:get/get.dart';

abstract class SelectStudentByIdController extends GetxController {
  getData(String studentId);
  initData();
}

class SelectStudentByIdControllerImp extends SelectStudentByIdController {
  SelectStudentByIdViewData selectStudentByIdViewData =
      SelectStudentByIdViewData(Get.find());
  late StatusRequest statusRequest;
  List studentList = [];

  late String studentId;

  @override
  getData(studentId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await selectStudentByIdViewData.getstudentByIdData(studentId);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        studentList.addAll(response['data']);
        print("Student data +++++++++++++++++++++: $studentList");
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
    // get the user id
    studentId = "16";
    getData(studentId);
  }
}
