import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';
import '../../../widgets/radiusText.dart';

class GetLocation extends GetView<BookingControllerImp> {
  const GetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              text: "Current",
              onPressed: () {
                controller.getCurrentLocation();
              },
              iconAssetPath: 'assets/screens/booking/gps.png',
              height: 45,
              width: 160,
            ),
            CustomButton(
              text: "Map",
              onPressed: () {
                controller.chooseLocationFromMap();
              },
              iconAssetPath: 'assets/screens/booking/map.png',
              height: 45,
              width: 160,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        RadiusText(text: "Location: ${controller.adress}")
      ],
    );
  }
}

 /*ElevatedButton.icon(
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
                    backgroundColor: Color.fromARGB(255, 148, 64, 72))),*/
            /*ElevatedButton.icon(
              onPressed: () {
                // Add code to choose from map
                controller.chooseLocationFromMap();
              },
              icon: Icon(Icons.map),
              label: Text('map'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 148, 64, 72)),
            )
          */