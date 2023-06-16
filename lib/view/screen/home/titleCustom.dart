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
          height: 15,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 114, 7),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
