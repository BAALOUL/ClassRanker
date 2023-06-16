import 'package:flutter/material.dart';

class OfferZoneCustom extends StatelessWidget {
  const OfferZoneCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber[800]),
      child: Stack(children: [
        Positioned(
          right: -60,
          top: -20,
          child: Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360), color: Colors.amber),
          ),
        )
      ]),
    );
  }
}
