import 'package:flutter/material.dart';

class SpacingBar extends StatelessWidget {
  const SpacingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
        ),
        // The second section of the rating.
        // spacing
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
