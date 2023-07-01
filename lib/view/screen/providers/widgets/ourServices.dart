import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select service",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ConsColors.blue,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContainer('Container 1'),
              _buildContainer('Container 2'),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContainer('Container 3'),
              _buildContainer('Container 4'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildContainer(String text) {
  return Container(
    width: 160,
    height: 35,
    decoration: BoxDecoration(
      color: ConsColors.blueWhite,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: ConsColors.yellow),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: ConsColors.blue,
          fontSize: 16,
          //fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
