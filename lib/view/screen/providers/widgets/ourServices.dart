import 'package:flutter/material.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width * 0.6) - 31,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Our services',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Landscaping work',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '2. Furniture work',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '3. Design work',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '3. Construction work',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          color: const Color.fromARGB(200, 100, 200, 200),
          child: Image.asset(
            "assets/images/homeMaintenance.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
