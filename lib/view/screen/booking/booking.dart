import 'package:ecommerce_store/controller/booking/bookingController.dart';
import 'package:ecommerce_store/view/screen/booking/components/additionalInformations.dart';
import 'package:ecommerce_store/view/screen/booking/components/getLocation.dart';
import 'package:ecommerce_store/view/screen/booking/components/richTextBooking.dart';
import 'package:ecommerce_store/view/screen/booking/components/selectDate.dart';
import 'package:ecommerce_store/view/screen/booking/components/titleSelectDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/spacingBar.dart';

class BookingView extends StatelessWidget {
  const BookingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingControllerImp());

    return Scaffold(
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            controller.goToProblemDescription();
          },
          child: const Text(
            'Book Now',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GetBuilder<BookingControllerImp>(
          builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Booking',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const RichTextBooking(),
                    const SpacingBar(),
                    const TitleSelectDate(),
                    const SizedBox(
                      height: 20,
                    ),
                    SelectDate(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SpacingBar(),
                    const GetLocation(),
                    const SizedBox(height: 30),
                    const AdditionalInformations(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ])),
        ));
  }
}
