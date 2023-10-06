import 'package:classRanker/controller/students/selectStudentByIdController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SelectStudentByIdControllerImp controller =
        Get.put(SelectStudentByIdControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome, ${controller.studentList[0].fu}', // Replace with the student's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Class:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Class A', // Replace with the class name
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Rank:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1', // Replace with the student's rank
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Additional Details:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'John Doe is a dedicated student who excels in mathematics and enjoys participating in extracurricular activities. He has consistently shown great commitment to his studies and is known for his teamwork and leadership skills.', // Replace with additional details
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
