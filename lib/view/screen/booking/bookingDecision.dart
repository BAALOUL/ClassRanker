import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/booking/bookingDecision.dart';
import '../../../core/constant/consColors.dart';
import '../../widgets/customButtonReaction.dart';
import '../../widgets/titleCustomBig.dart';
import 'components/radiusSimpleText.dart';

class BookingDecision extends StatelessWidget {
  BookingDecision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<BookingDecisionControllerImp>(BookingDecisionControllerImp());
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
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'You have new request'.tr,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ConsColors.blue),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            GetBuilder<BookingDecisionControllerImp>(
              builder: (controller) => SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.only(top: 80),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    children: [
                      TitleCustomBig(
                        title: "Service".tr,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.serviceName),
                      TitleCustomBig(
                        title: "Customer".tr,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.username),
                      TitleCustomBig(
                        title: "Date".tr,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.bookingDate),
                      TitleCustomBig(
                        title: "Location".tr,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.bookingAddress),

                      //************************************** */

                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            child: CustomButtonReaction(
                              text: "Accept".tr,
                              status: "accept",
                              height: 45,
                              size: 18,
                              fontWeight: FontWeight.bold,
                              onPressed: () {
                                controller.bookingStatus("current");
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: CustomButtonReaction(
                              text: "Reject".tr,
                              status: "reject",
                              height: 45,
                              size: 18,
                              fontWeight: FontWeight.bold,
                              onPressed: () {
                                _showRejectionDialog(context);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRejectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedReason = '';

        return AlertDialog(
          title: Text('Reason for Rejection'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // List of choices
              ListTile(
                title: Text('Provider is fully booked with other demands.'.tr),
                onTap: () {
                  selectedReason =
                      'Provider is fully booked with other demands.'.tr;
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Provider is on vacation/holiday'.tr),
                onTap: () {
                  selectedReason = 'Provider is on vacation/holiday'.tr;
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                    'Provider is unable to travel to the requested location'
                        .tr),
                onTap: () {
                  selectedReason =
                      'Provider is unable to travel to the requested location'
                          .tr;
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Provider is experiencing technical difficulties'.tr),
                onTap: () {
                  selectedReason =
                      'Provider is experiencing technical difficulties'.tr;
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Provider is currently unavailable'.tr),
                onTap: () {
                  selectedReason = 'Provider is currently unavailable'.tr;
                  //Navigator.pop(context);
                },
              ),
              // Text field for custom reason
              TextField(
                onChanged: (value) {
                  selectedReason = value;
                },
                decoration: InputDecoration(labelText: 'Other reason'.tr),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                if (selectedReason.isNotEmpty) {
                  // Get the controller instance
                  BookingDecisionControllerImp controller =
                      Get.find<BookingDecisionControllerImp>();
                  // Call controller method to handle rejection
                  controller.selectedReason = selectedReason;
                  controller.bookingStatus("rejected");
                }
                //Navigator.pop(context);
              },
              child: Text('Reject'.tr),
            ),
          ],
        );
      },
    );
  }
}
