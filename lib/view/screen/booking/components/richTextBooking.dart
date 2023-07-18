import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';
import '../../../../core/services/services.dart';

class RichTextBooking extends GetView<BookingControllerImp> {
  const RichTextBooking({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
        children: [
          TextSpan(
            text: 'You are now in the process of booking the '.tr,
          ),
          TextSpan(
            text: savedLang == "en"
                ? controller.serviceName
                : controller.serviceNameAr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' service, which will be performed by '.tr,
          ),
          TextSpan(
            text: controller.provName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
