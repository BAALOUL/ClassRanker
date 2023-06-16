import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';

class GetLocation extends GetView<BookingControllerImp> {
  const GetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Select your Location:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  // Add code to get current position
                  controller.getCurrentLocation();
                  // ignore: unnecessary_null_comparison
                  if (controller.currentLocation != null) {
                    print(
                      'Latitude: ${controller.latitude}\n'
                      'Longitude: ${controller.longitude}\n Street: ${controller.currentStreet}',
                    );
                  } else {
                    print('No location data');
                  }
                },
                icon: const Icon(Icons.my_location),
                label: const Text('Current'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 148, 64, 72))),
            const Text(
              'or',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Add code to choose from map
                controller.chooseLocationFromMap();
              },
              icon: Icon(Icons.map),
              label: Text('map'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 148, 64, 72)),
            )
          ],
        ),
      ],
    );
  }
}
