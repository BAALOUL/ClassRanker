import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  final title;
  const TitleCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: ConsColors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
