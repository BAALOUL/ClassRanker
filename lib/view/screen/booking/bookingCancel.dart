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
    return const Scaffold(
      body: Text("text"),
    );
  }
}
