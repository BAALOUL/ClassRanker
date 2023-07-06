import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class TitleCustomBig extends StatelessWidget {
  final title;
  final double? size;
  final FontWeight fontWeight; // Change type to double?

  const TitleCustomBig({
    Key? key,
    required this.title,
    this.size,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ConsColors.blue,
            fontSize: size ?? 22, // Use size if it's not null, otherwise use 22
            fontWeight: fontWeight,
            height: 1.9, // Adjust the height value as needed
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
