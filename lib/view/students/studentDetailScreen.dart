import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:classRanker/controller/students/studentDetailController.dart';
import 'package:classRanker/data/model/studentModel.dart';

import '../../core/constant/consColors.dart';
import '../widgets/appBar/firstRowBackArrow.dart';
import '../widgets/auth/customButton.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentDetailControllerImp controller =
        Get.put(StudentDetailControllerImp());

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: ConsColors.blueWhite,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FirstRowBackArrow(),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ConsColors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  //const RichTextBooking(),
                ],
              ),
            ),
          ),
          Positioned(
              top: 120,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GetBuilder<StudentDetailControllerImp>(
                      builder: (controller) {
                        if (controller.studentModel == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final StudentModel student = controller.studentModel;

                          // Create a custom widget to display student details
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name: ${student.fullName}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Class Name: ${student.className}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Rank: ${student.rank}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Grade: ${student.grade ?? 'N/A'}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Attendance: ${student.attendance ?? 'N/A'}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 50),
                              // Add important buttons in a grid
                              GridView.count(
                                crossAxisCount: 2, // 2 columns
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 4.3,
                                shrinkWrap: true,
                                children: [
                                  CustomButton(
                                    text: "Edit",
                                    onPressed: () {
                                      controller.goToStudentEdit(student);
                                    },
                                  ),
                                  CustomButton(
                                    text: "Delete",
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Delete Student"),
                                            content: const Text(
                                                "Are you sure you want to delete this student?"),
                                            actions: [
                                              TextButton(
                                                child: const Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text("Delete"),
                                                onPressed: () async {
                                                  // Call the deleteStudent method and assert that student.id is not null
                                                  await controller
                                                      .deleteStudent(
                                                          student.id!);
                                                  //Get.toNamed(ConsRoutes.getstudentsListScreen);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
