import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';

class TitleSelectDate extends GetView<BookingControllerImp> {
  const TitleSelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Select a date:',
      style: TextStyle(
          fontSize: 24.0,
          //fontWeight: FontWeight.bold,
          color: ConsColors.blue),
    );
  }
}
