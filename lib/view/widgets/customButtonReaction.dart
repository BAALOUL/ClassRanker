import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomButtonReaction extends StatelessWidget {
  final Function()? onPressed;
  String text;
  final String? iconAssetPath;
  final FontWeight fontWeight;
  final double height;
  final double size;
  final String status;

  CustomButtonReaction({
    Key? key,
    this.text = 'button',
    this.onPressed,
    this.iconAssetPath,
    this.fontWeight = FontWeight.normal,
    this.height = 35.0,
    this.size = 12.0,
    this.status = "complete",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = ConsColors.yellow;
    Color backgroundColor = Colors.white;

    if (status == "cancel") {
      borderColor = ConsColors.yellow;
      backgroundColor = Colors.white;
      text = "Cancel".tr;
    } else if (status == "complete") {
      borderColor = ConsColors.yellow;
      backgroundColor = ConsColors.yellow;
      text = "Complete".tr;
    } else if (status == "accept") {
      borderColor = Colors.green;
      backgroundColor = Color.fromARGB(255, 152, 236, 87);
      text = "Accept".tr;
    } else if (status == "reject") {
      borderColor = Colors.red;
      backgroundColor = Colors.white;
      text = "Reject".tr;
    }

    return Container(
      height: height,
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconAssetPath != null) // Render the icon only if it is provided
              Image.asset(
                iconAssetPath!,
                width: 24, // Adjust the width as per your requirement
                height: 24, // Adjust the height as per your requirement
              ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: ConsColors.blue,
                fontSize: size,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
