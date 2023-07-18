// 1- create the view for the provider details
// 2- create the controller for the provider details
// 3- determine the functions for the provider details
// we have : read details from the database from different tables such as provider and reviews
// an other function to perform the booking

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/controller/booking/bookingController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/booking/components/radiusSimpleText.dart';
import 'package:ecommerce_store/view/widgets/firstRow.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/services.dart';
import '../../widgets/auth/customButton.dart';
import '../../widgets/titleCustomBig.dart';

class BookingSummary extends StatelessWidget {
  //final List<Review> reviewList;
  const BookingSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    Get.put(BookingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const FirstRowBackArrow(),
        backgroundColor: ConsColors.blueWhite,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
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
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            'Booking summary'.tr,
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
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(top: 60),
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
                        RadiusSimpleText(
                            text: savedLang == "en"
                                ? controller.serviceName
                                : controller.serviceNameAr),
                        TitleCustomBig(
                          title: "Provider".tr,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        RadiusSimpleText(text: controller.provName),
                        TitleCustomBig(
                          title: "Customer".tr,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        RadiusSimpleText(text: controller.customerName),
                        TitleCustomBig(
                          title: "Date".tr,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        RadiusSimpleText(text: controller.dateSelected),
                        TitleCustomBig(
                          title: "Location".tr,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        RadiusSimpleText(text: controller.adress),
                        TitleCustomBig(
                          title: "Problem description".tr,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        RadiusSimpleText(
                          text: controller.description,
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50.0, right: 50, top: 20, bottom: 15),
                          child: CustomButton(
                            text: "Submit".tr,
                            onPressed: () {
                              controller.booking();
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
    );
  }
}
