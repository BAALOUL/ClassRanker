// 1- create the view for the provider details
// 2- create the controller for the provider details
// 3- determine the functions for the provider details
// we have : read details from the database from different tables such as provider and reviews
// an other function to perform the booking

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/controller/booking/bookingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consRoutes.dart';

class BookingMessage extends StatelessWidget {
  const BookingMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BookingControllerImp());
    return Scaffold(
      body: GetBuilder<BookingControllerImp>(
          builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 64,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Your request has been received successfully, and has been sent to the service provider \n You will receive a response very soon',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 2, 148, 39)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'In the event that the response is more than 30 min late, you can cancel the request and re-select another service provider',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.offAllNamed(ConsRoutes.homescreen, arguments: {});
                        },
                        icon: const Icon(Icons.home),
                        label: const Text("Go Home"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
