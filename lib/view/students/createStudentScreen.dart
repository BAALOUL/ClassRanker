import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/students/createStudentController.dart';
import '../../core/constant/consColors.dart';
import '../widgets/auth/customButton.dart';
import '../widgets/appBar/firstRowBackArrow.dart';
import '../widgets/titleCustomBig.dart';

class CreateStudentScreen extends StatelessWidget {
  const CreateStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreateStudentControllerImp controller =
        Get.put(CreateStudentControllerImp());

    return SafeArea(
      child: Scaffold(
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
                    'Edit student data'.tr,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleCustomBig(
                            title: "Username".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.usernameController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),
                          TitleCustomBig(
                            title: "Password".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.passwordController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),
                          TitleCustomBig(
                            title: "Full name".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.fullNameController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),
                          // the Class
                          TitleCustomBig(
                            title: "Class name".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.classNameController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),

                          /// the Rank
                          TitleCustomBig(
                            title: "Rank".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.rankController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),

                          // the Grade
                          TitleCustomBig(
                            title: "Grade".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.gradeController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),

                          // The Attendance
                          TitleCustomBig(
                            title: "Attendance".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.attendanceController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),

                          // The Attendance
                          TitleCustomBig(
                            title: "Email".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.emailController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),

                          // The Attendance
                          TitleCustomBig(
                            title: "phone".tr,
                            size: 18,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: controller.phoneController,
                              decoration: const InputDecoration(
                                //labelText: 'Name',
                                border: InputBorder
                                    .none, // Remove the default border
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),

                          /*TextFormField(
                    controller: controller.rankController,
                    decoration: const InputDecoration(labelText: 'Rank'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a rank';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Rank must be a number';
                      }
                      return null;
                    },
                  ),*/
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                text: "Save",
                                onPressed: () {
                                  controller.createStudentData();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ))),
    );
  }
}
