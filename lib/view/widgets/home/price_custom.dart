import 'package:flutter/material.dart';

class PriceCustom extends StatelessWidget {
  final String price;
  const PriceCustom({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 11,
        bottom: 26,
        child: Text(
          textAlign: TextAlign.center,
          "$price QR",
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.yellow),
        ));
  }
}
