import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(25.3548, 51.1839), // Qatar coordinates
      zoom: 9.0,
    ); // Default zoom level
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Location'),
        ),
        body: GestureDetector(
          onTap: () {
            // Return null when the screen is closed without selecting a location
            Get.back(result: null);
          },
          child: GoogleMap(
            // Configure the GoogleMap widget as needed, such as setting initial camera position, markers, etc.
            initialCameraPosition: initialCameraPosition,
            onLongPress: (LatLng location) {
              // Return the selected location when the map is long-pressed
              Get.back(result: location);
            },
          ),
        ));
  }
}
