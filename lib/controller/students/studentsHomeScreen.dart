import 'package:classRanker/controller/students/studentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/consColors.dart';
import '../../view/widgets/appBar/firstRowBackArrow.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentControllerImp controller = Get.put(StudentControllerImp());
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
                children: [
                  const FirstRowBackArrow(),
                  Text(
                    'Welcome, ${controller.studentName}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ConsColors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your rank in the class: ${controller.className}\n is:",
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign
                            .center, // Align the text within the Text widget
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.rank,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign
                            .center, // Align the text within the Text widget
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
