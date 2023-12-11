import 'package:classRanker/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  // Width and height initialization
  static void init(BuildContext context) {
    screenWidth = Get.width;
    screenHeight = Get.height;
  }

  // Get the proportionate height as per screen size
  static double getProportionateScreenHeight(double inputHeight) {
    // Use the static property, not the local variable
    double screenHeight = Config.screenHeight!;
    // 812 is the layout height that the designer used
    return (inputHeight / 812.0) * screenHeight;
  }

  // Get the proportionate width as per screen size
  static double getProportionateScreenWidth(double inputWidth) {
    // Use the static property, not the local variable
    double screenWidth = Config.screenWidth!;
    // 375 is the layout width that the designer used
    return (inputWidth / 375.0) * screenWidth;
  }

  // Define spacing height
  static const spaceSmall = SizedBox(
    height: 25,
  );
  static SizedBox spaceMedium() {
    return SizedBox(
      height: screenHeight! * 0.05,
    );
  }

  static SizedBox spaceBig() {
    return SizedBox(
      height: screenHeight! * 0.08,
    );
  }

  // Textform field border
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ),
  );

  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );

  static const primaryColor = ConsColors.yellow; //Colors.greenAccent;
}
