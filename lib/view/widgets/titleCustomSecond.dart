import 'package:classRanker/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class TitleCustomSecond extends StatelessWidget {
  final title;
  const TitleCustomSecond({super.key, required this.title});

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
          style: const TextStyle(
            color: ConsColors.yellow,
            fontSize: 24,
            //fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
