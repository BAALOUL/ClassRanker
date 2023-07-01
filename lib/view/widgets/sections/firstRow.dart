import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/screens/sections/bells.png'),
            onPressed: () {},
          ),
          const Spacer(), // Adds flexible space between icons
          IconButton(
            icon: Image.asset('assets/screens/sections/man.png'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
