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
          height: 15,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 6, 6, 6),
            fontSize: 16,
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
