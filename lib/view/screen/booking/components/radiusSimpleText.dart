import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class RadiusSimpleText extends StatelessWidget {
  final String text;
  final double height;
  final FontWeight fontWeight;

  const RadiusSimpleText({
    Key? key,
    required this.text,
    this.height = 45,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ConsColors.blueWhite,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 15, top: 8),
        child: Text(
          text,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ConsColors.black,
            fontSize: 16,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
