import 'package:classRanker/data/remote/students/searchStudentsData.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';
import '../../data/model/studentModel.dart';

class StudentSearchController extends GetxController {
  SearchStudentData studentsViewData = SearchStudentData(Get.find());

  late StatusRequest statusRequest;
  List<StudentModel> studentsList = [];
  RxList<StudentModel> filteredStudents = <StudentModel>[].obs;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await studentsViewData.getStudentsData();
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        final List<dynamic> data = response['data'];

        // Clear the studentsList before adding new data
        studentsList.clear();

        studentsList = data
            .map((studentData) => StudentModel.fromJson(studentData))
            .toList();

        // Initialize filteredStudents with all students initially
        filteredStudents.assignAll(studentsList);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void searchStudents(String query) {
    if (query.isEmpty) {
      // If the search query is empty, show all students
      filteredStudents.assignAll(studentsList);
    } else {
      filteredStudents.assignAll(studentsList
          .where((student) =>
              (student.fullname?.toLowerCase()?.contains(query.toLowerCase()) ??
                  false) ||
              (student.classname
                      ?.toLowerCase()
                      ?.contains(query.toLowerCase()) ??
                  false))
          .toList());
    }
    update();
  }

  // Add additional filtering methods here for class name, criteria, etc.

  @override
  void onInit() async {
    print("I am here search student");
    await getData();
    super.onInit();
  }
}
