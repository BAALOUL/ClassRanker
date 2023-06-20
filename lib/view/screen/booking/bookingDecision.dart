import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/booking/bookingDecision.dart';

class BookingDecision extends StatelessWidget {
  BookingDecision({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    Get.put<BookingDecisionControllerImp>(BookingDecisionControllerImp());
    return Scaffold(
      body: GetBuilder<BookingDecisionControllerImp>(
        builder: (controller) => SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                const TitleCustom(
                  title: "You have a new request",
                ),
                const SizedBox(height: 10),
                const Text(
                  'The service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.serviceName,
                  style: const TextStyle(fontSize: 14),
                ),
                //************************************** */
                const SizedBox(height: 20),
                const Text(
                  'Customer name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.username,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.bookingDate,
                  style: const TextStyle(fontSize: 14),
                ),
                //****************   */  Location
                const SizedBox(height: 20),
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.bookingAddress,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 60),
                const Text(
                  'The customer can cancel the request in the event of no response within half an hour from the time of receiving the request',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 173, 36, 36),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.bookingStatus("current");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          _showRejectionDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Reject',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
