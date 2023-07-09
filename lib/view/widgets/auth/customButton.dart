import 'dart:ffi';

import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final String? iconAssetPath;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final double size;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.iconAssetPath,
    this.fontWeight = FontWeight.normal,
    this.height = 50.0,
    this.width = 200.0,
    this.size = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ConsColors.yellow,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
