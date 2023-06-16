import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';

class AdditionalInformations extends GetView<BookingControllerImp> {
  const AdditionalInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Additional Informations",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            const CircleAvatar(
              radius: 10,
              backgroundColor: Color.fromARGB(255, 148, 64, 72),
              child: Icon(Icons.apartment, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 8),
            const Text("Appartment"),
            const SizedBox(width: 15),
            SizedBox(
              width: 60,
              height: 30,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.appartment.value = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            const CircleAvatar(
              radius: 10,
              backgroundColor: Color.fromARGB(255, 148, 64, 72),
              child: Icon(Icons.stairs, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 8),
            const Text("Floor"),
            const SizedBox(width: 58),
            SizedBox(
              width: 60,
              height: 30,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.floor.value = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            const CircleAvatar(
              radius: 10,
              backgroundColor: Color.fromARGB(255, 148, 64, 72),
              child: Icon(Icons.home, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 8),
            const Text("House N°"),
            const SizedBox(width: 34),
            SizedBox(
              width: 60,
              height: 30,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.houseN.value = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  controller.adress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 17, 159, 39),
                    fontFamily: 'Cairo',
                  ),
                  maxLines: null, // Set maxLines to null for multiline
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ],
    );
  }
}
