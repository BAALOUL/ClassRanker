// 1- create the view for the provider details
// 2- create the controller for the provider details
// 3- determine the functions for the provider details
// we have : read details from the database from different tables such as provider and reviews
// an other function to perform the booking

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/booking/bookingDecision.dart';

class BookingDecision extends StatelessWidget {
  //final List<Review> reviewList;
  const BookingDecision({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BookingDecisionControllerImp());
    return Scaffold(
      body: GetBuilder<BookingDecisionControllerImp>(
          builder: (controller) => SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      const TitleCustom(
                        title: "You have new request",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'The service',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Landscaping work',
                        style: TextStyle(fontSize: 14),
                      ),
                      //************************************** */

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Sunday 12/01/2023',
                        style: TextStyle(fontSize: 14),
                      ),
                      //****************   */  Location

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Alsad 1021 Doha - Qatar',
                        style: TextStyle(fontSize: 14),
                      ),

                      const SizedBox(
                        height: 60,
                      ),

                      const Text(
                        'The customer can cancel the request in the event of no response within half an hour from the time of receiving the request',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 173, 36, 36)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add code for accepting the request
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
                                // Add code for rejecting the request
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
              )),
    );
  }
}
