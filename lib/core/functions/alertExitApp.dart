import 'dart:io';

import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Hey".tr,
      titleStyle: const TextStyle(
          color: ConsColors.primary, fontWeight: FontWeight.bold),
      middleText: "Do you want exit ?".tr,
      actions: [
        CustomButton(
          text: "Confirm".tr,
          size: 14,
          height: 35,
          width: 120,
          onPressed: () async {
            // await logout();
            exit(0);
          },
        ),
        CustomButton(
          text: "Cancel".tr,
          size: 14,
          height: 35,
          width: 120,
          onPressed: () {
            Get.back();
          },
        ),
      ]);
  return Future.value(true);
}
