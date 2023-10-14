import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/students/getStudentsListController.dart';
import '../../core/class/statusRequest.dart';
import '../../data/model/newModel.dart'; // Import the correct model

class GetStudentList extends StatelessWidget {
  const GetStudentList({Key? key}) : super(key: key);

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
              if (controller.usersList.isEmpty) {
                return const Center(child: Text('No students available.'));
              }
              return ListView.builder(
                itemCount: controller.usersList.length,
                itemBuilder: (context, index) {
                  final user = controller.usersList[index];
                  return ListTile(
                    leading: Image.network(user.avatar), // Display the avatar
                    title: Text(
                        'Name: ${user.firstName} ${user.lastName}'), // Display the full name
                    subtitle: Text('Email: ${user.email}'), // Display the email
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
