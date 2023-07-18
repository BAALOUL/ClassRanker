import 'package:ecommerce_store/controller/booking/bookingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consColors.dart';
import '../../../core/constant/consRoutes.dart';
import '../../widgets/auth/customButton.dart';

class BookingMessage extends StatelessWidget {
  const BookingMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BookingControllerImp());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<BookingControllerImp>(
            builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        color: ConsColors.blueWhite,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            /*SizedBox(height: 8),
                            Text(
                              'Booking Completed',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: ConsColors.blue),
                            ),*/
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 50),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Image.asset(
                              'assets/screens/bookingMessage/Completed.png', // Replace with your image asset path
                              fit: BoxFit.contain,
                              height: 280,
                            ),
                          ),
                          Text(
                            'Your request has been received successfully, and sent to the service provider \n You will receive a response very soon'
                                .tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                //color: Color.fromARGB(255, 2, 148, 39)),
                                color: ConsColors.blue),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'If the response takes more than 30 minutes, you can cancel the request and choose a different service provider.'
                                .tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 50, top: 20, bottom: 15),
                            child: CustomButton(
                              text: "Go Home".tr,
                              onPressed: () {
                                Get.offAllNamed(ConsRoutes.homeProvider,
                                    arguments: {});
                              },
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
