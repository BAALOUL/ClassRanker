import 'package:flutter/material.dart';

import '../../../core/constant/consColors.dart';

class CustomButtonLang extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConsColors.primary,
      //padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
