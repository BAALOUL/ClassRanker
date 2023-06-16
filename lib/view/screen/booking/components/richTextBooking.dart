import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';

class RichTextBooking extends GetView<BookingControllerImp> {
  const RichTextBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
        children: [
          const TextSpan(
            text: 'You are now in the process of booking the ',
          ),
          TextSpan(
            text: controller.serviceName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: ' service, which will be performed by ',
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
