import 'package:classRanker/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class CustomTextSignUp extends StatelessWidget {
  final String text1, text2;
  final Function()? ontap;
  const CustomTextSignUp(
      {super.key, required this.text1, required this.text2, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
            onTap: ontap,
            child: Text(
              text2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: ConsColors.primary),
            ))
      ],
    );
  }
}
