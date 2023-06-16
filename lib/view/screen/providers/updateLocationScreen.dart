import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class ProviderLocationUpdateScreen extends StatelessWidget {
  final locationController = Get.put(LocationController());

  ProviderLocationUpdateScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'City: ${locationController.currentCity.value}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Obx(
              () => Text(
                'Province: ${locationController.currentProvince.value}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Obx(
              () => Text(
                'Street: ${locationController.currentStreet.value}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: locationController.updateUserLocation,
        child: const Icon(Icons.location_on),
      ),
    );
  }
}

class LocationController extends GetxController {
  var currentLocation = ''.obs;
  var currentCity = ''.obs;
  var currentProvince = ''.obs;
  var currentStreet = ''.obs;

  @override
  void onInit() {
    super.onInit();
    everAll([currentLocation, currentCity, currentProvince], (_) => update());
    updateUserLocation();
  }

  void updateUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Handle location permission denied
        // Show appropriate error message or dialog
        return;
      }

      Position position = await Geolocator.getCurrentPosition();

      updateProviderLocation(position.latitude, position.longitude);

      currentLocation.value =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';

      // Reverse geocoding to get the city and province information
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        currentCity.value = placemarks[0].locality ?? '';
        currentProvince.value = placemarks[0].administrativeArea ?? '';
        currentStreet.value = placemarks[0].street ?? '';
      }
    } catch (e) {
      // Handle any errors
      //print('Error: $e');
    }
  }

  void updateProviderLocation(double latitude, double longitude) {}
}
