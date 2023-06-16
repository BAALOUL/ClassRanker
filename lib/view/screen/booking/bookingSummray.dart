// 1- create the view for the provider details
// 2- create the controller for the provider details
// 3- determine the functions for the provider details
// we have : read details from the database from different tables such as provider and reviews
// an other function to perform the booking

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/controller/booking/bookingController.dart';
import 'package:ecommerce_store/view/screen/booking/bookingButton.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingSummary extends StatelessWidget {
  //final List<Review> reviewList;
  const BookingSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BookingControllerImp());
    return Scaffold(
      body: GetBuilder<BookingControllerImp>(
          builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    const TitleCustom(
                      title: "Booking Summary",
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
                    Text(
                      controller.serviceName,
                      style: const TextStyle(fontSize: 14),
                    ),
                    //************************************** */
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'The provider',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.provName,
                      style: const TextStyle(fontSize: 14),
                    ), //*************************************  */
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'The Customer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.customerName,
                      style: const TextStyle(fontSize: 14),
                    ), //*************************************  */
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
                    Text(
                      controller.dateSelected,
                      style: const TextStyle(fontSize: 14),
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
                    Text(
                      controller.adress,
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Problem description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.description,
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(
                      height: 60,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        BookingButton(
                            text: "Submit",
                            onPressed: () {
                              controller.booking();
                            }),
                        const SizedBox(
                          width: 1,
                        ),
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
