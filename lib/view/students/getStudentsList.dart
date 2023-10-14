import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/students/getStudentsListController.dart';
import '../../core/class/statusRequest.dart';

class GetStudentList extends StatelessWidget {
  const GetStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    GetStudentsListControllerImp controller =
        Get.put(GetStudentsListControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: GetBuilder<GetStudentsListControllerImp>(
        builder: (controller) {
          switch (controller.statusRequest) {
            case StatusRequest.loading:
              return const Center(child: CircularProgressIndicator());
            case StatusRequest.success:
              if (controller.studentList.isEmpty) {
                return const Center(child: Text('No students available.'));
              }
              return ListView.builder(
                itemCount: controller.studentList.length,
                itemBuilder: (context, index) {
                  final student = controller.studentList[index];
                  return ListTile(
                    title: Text(student.id),
                  );
                },
              );
            case StatusRequest.failure:
              return Center(child: Text('Failed to load students.'));
            default:
              return Container();
          }
        },
      ),
    );
  }
}
