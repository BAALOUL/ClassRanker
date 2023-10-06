import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/students/getStudentsByClassViewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../data/model/studentModel.dart';

abstract class GetStudentsByClassController extends GetxController {
  getData(String className);
  initData();
  goToStudentDetails(StudentModel studentModel);
}

class GetStudentsByClassControllerImp extends GetStudentsByClassController {
  GetStudentsByClassViewData getStudentsByClassViewData =
      GetStudentsByClassViewData(Get.find());
  late StatusRequest statusRequest;
  List studentList = [];

  late String className;
  String classSelected = "";
  late String itemSelected;

  @override
  getData(String className) async {
    statusRequest = StatusRequest.loading;
    studentList.clear();
    update();

    var response =
        await getStudentsByClassViewData.getstudentByClassData(className);

    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        final List<dynamic> data = response['data'];
        studentList = data
            .map((studentData) => StudentModel.fromJson(studentData))
            .toList();

        // Sort the studentList by rank
        studentList.sort((a, b) {
          final rankA = int.tryParse(a.rank ?? "0") ?? 0;
          final rankB = int.tryParse(b.rank ?? "0") ?? 0;
          return rankA.compareTo(rankB);
        });
        print(studentList);
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
    className = "";
    statusRequest = StatusRequest.none;
    //getData(className);
  }

  // Update the className when the selectedItem changes
  void updateClass(String selectedItem) {
    className = selectedItem;
    getData(className);
  }

  @override
  void goToStudentDetails(StudentModel studentModel) {
    Get.toNamed(
      ConsRoutes.studentDetailScreen,
      arguments: {"student_model": studentModel},
    );
  }
}
