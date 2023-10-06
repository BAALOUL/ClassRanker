import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/students/searchStudentsController.dart';
import '../../core/class/statusRequest.dart';

class SearchStudentScreen extends StatelessWidget {
  final StudentSearchController controller = Get.put(StudentSearchController());

  SearchStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (query) {
                controller.searchStudents(query);
              },
              decoration: const InputDecoration(
                labelText: 'Search by Name or Class Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: GetBuilder<StudentSearchController>(
                builder: (controller) {
                  if (controller.statusRequest == StatusRequest.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.statusRequest ==
                      StatusRequest.failure) {
                    return const Center(
                        child: Text('Failed to load students.'));
                  } else if (controller.filteredStudents.isEmpty) {
                    return const Center(child: Text('No results found.'));
                  } else {
                    return ListView.builder(
                      itemCount: controller.filteredStudents.length,
                      itemBuilder: (context, index) {
                        final student = controller.filteredStudents[index];
                        print(student);
                        return ListTile(
                          title: Text(student.fullname ?? 'No Name'),
                          subtitle: Text(student.classname ?? 'No Class Name'),
                          onTap: () {
                            if (student != null) {
                              print(
                                  "Student Id: ${student.studentid ?? 'N/A'}");
                              print(
                                  "Student Full Name: ${student.fullname ?? 'N/A'}");
                              print(
                                  "Student Class Name: ${student.classname ?? 'N/A'}");
                              // Add more attributes as needed

                              // Navigate to StudentDetailScreen
                              Get.toNamed(
                                ConsRoutes.studentDetailScreen,
                                arguments: {"student_model": student},
                              );
                            } else {
                              print("Tapped on a null student object.");
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            CustomButton(
              text: "reload",
              onPressed: () {
                controller.getData();
              },
            )
          ],
        ),
      ),
    );
  }
}
