import 'package:classRanker/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class CustomForgetPassword extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CustomForgetPassword(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 16, color: ConsColors.primary),
      ),
    );
  }
}
