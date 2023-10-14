import 'package:classRanker/core/class/handlingDataView.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/view/screen/home/titleCustom.dart';
import 'package:classRanker/view/students/components/selectClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/students/getStudentsByClassController.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/consColors.dart';
import '../widgets/appBar/firstRowBackArrow.dart';
import '../widgets/auth/customButton.dart';
import '../widgets/titleCustomBig.dart';

class GetStudentsListScreen extends StatelessWidget {
  const GetStudentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'Admin DashBoard'.tr,
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
                child: ListView(
                  children: [
                    TitleCustomBig(title: "Select a class".tr),
                    const SelectClass(),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<GetStudentsByClassControllerImp>(
                      builder: ((controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: SizedBox(
                              height: 400,
                              child: ListView.builder(
                                shrinkWrap:
                                    true, // Important for nested ListView
                                itemCount: controller.studentList.length,
                                itemBuilder: (context, index) {
                                  final student = controller.studentList[index];
                                  return InkWell(
                                    onTap: () {},
                                    child: ListTile(
                                      onTap: () {
                                        controller.goToStudentDetails(
                                            student); // Pass the StudentModel to the detail screen
                                      },
                                      title: Text(student.fullname),
                                      subtitle: Row(
                                        children: [
                                          Text(student.classname),
                                          const Spacer(),
                                          Text(student.rank),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: 16, // Adjust the position as needed
                      right: 16, // Adjust the position as needed
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(ConsRoutes.createStudentScreen);
                        },
                        backgroundColor:
                            ConsColors.blue, // Change the color here
                        child: Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: "Get Students list",
                      onPressed: () {
                        Get.toNamed(ConsRoutes.getStudentsList);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
