import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/booking/bookingController.dart';

class SimpleTextFieldCustom extends GetView<BookingControllerImp> {
  final String typeT;
  const SimpleTextFieldCustom({
    super.key,
    required this.typeT,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConsColors.blueWhite,
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          switch (typeT) {
            case "appartment":
              controller.appartment.value = int.parse(value);
              break;
            case "floor":
              controller.floor.value = int.parse(value);
              break;
            case "houseN":
              controller.houseN.value = int.parse(value);
              break;
          }
        },
        decoration: const InputDecoration(
          hintText: "Type here",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
