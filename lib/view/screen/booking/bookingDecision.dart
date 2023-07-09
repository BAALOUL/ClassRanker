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
                  children: const [
                    SizedBox(height: 25),
                    Text(
                      'You have new request',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ConsColors.blue),
                    ),
                    SizedBox(height: 8),
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
                      const TitleCustomBig(
                        title: "Service",
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.serviceName),
                      const TitleCustomBig(
                        title: "Customer",
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.username),
                      const TitleCustomBig(
                        title: "Date",
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      RadiusSimpleText(text: controller.bookingDate),
                      const TitleCustomBig(
                        title: "Location",
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
                              text: "Accept",
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
                              text: "Reject",
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
          title: const Text('Reason for Rejection'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // List of choices
              ListTile(
                title:
                    const Text('Provider is fully booked with other demands.'),
                onTap: () {
                  selectedReason =
                      'Provider is fully booked with other demands.';
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Provider is on vacation/holiday'),
                onTap: () {
                  selectedReason = 'Provider is on vacation/holiday';
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                    'Provider is unable to travel to the requested location'),
                onTap: () {
                  selectedReason =
                      'Provider is unable to travel to the requested location';
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                    'Provider is experiencing technical difficulties'),
                onTap: () {
                  selectedReason =
                      'Provider is experiencing technical difficulties';
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Provider is currently unavailable'),
                onTap: () {
                  selectedReason = 'Provider is currently unavailable';
                  //Navigator.pop(context);
                },
              ),
              // Text field for custom reason
              TextField(
                onChanged: (value) {
                  selectedReason = value;
                },
                decoration: const InputDecoration(labelText: 'Other reason'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
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
              child: const Text('Reject'),
            ),
          ],
        );
      },
    );
  }
}
