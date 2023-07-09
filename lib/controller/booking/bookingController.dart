import 'dart:io';

import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/data/model/providerModel.dart';
import 'package:ecommerce_store/data/remote/booking/bookingUp.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../core/services/services.dart';

import '../../core/functions/handingDataController.dart';
import 'maScreen.dart';

abstract class BookingController extends GetxController {
  initData();
  booking();
  updateDate(String text);
  chooseLocationFromMap();
  goToProblemDescription();
  goToBookinSummary();
  goToBookingMessage();
}

class BookingControllerImp extends BookingController {
  StatusRequest? statusRequest;
  BookingUp bookingUp = BookingUp(Get.find());
  MyServices myServices = Get.find();

  RxList<File> selectedPhotos = <File>[].obs;

  var currentLocation = ''.obs;
  var currentCity = ''.obs;
  var currentProvince = ''.obs;
  var currentStreet = ''.obs;

  late String serviceName;
  late String userId;
  late String provId;
  late String provName;
  late String servId;
  late String customerName;
  String adress = '';
  String dateSelected = DateFormat('dd/MM/yyyy').format(DateTime.now());
  late String status;
  //LocationData? currentLocation;
  late String latitude = '';
  late String longitude = '';
  RxInt appartment = RxInt(0);
  RxInt floor = RxInt(0);
  RxInt houseN = RxInt(0);
  late String description = '';

  late String itemSelected;

  List bookData = [];

  void addPhoto(File photo) {
    selectedPhotos.add(photo);
    update();
  }

  void deletePhoto(int index) {
    selectedPhotos.removeAt(index);
    update();
  }

  @override
  initData() {
    userId = myServices.sharedPreferences.getString("userId").toString();
    String customer =
        myServices.sharedPreferences.getString("username").toString();
    customer == "" ? customerName = "Customer$userId" : customerName = customer;
    ProviderModel providerModel = Get.arguments['provider_model'];
    provId = providerModel.providerid!;
    provName = providerModel.providername!;
    serviceName = Get.arguments['serviceName'];
    servId = Get.arguments['serviceId'];
    status = "pending";
  }

  @override
  void onInit() {
    initData();
    everAll([currentLocation, currentCity, currentProvince], (_) => update());
    //getCurrentLocation();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  booking() async {
    // ignore: unnecessary_null_comparison
    if (latitude != null) {
      statusRequest = StatusRequest.loading;
      update();
      ////print(username);

      var response = await bookingUp.postBooking(
          userId,
          provId,
          servId,
          dateSelected,
          status,
          latitude,
          longitude,
          appartment.toString(),
          floor.toString(),
          houseN.toString(),
          adress,
          description);

      statusRequest = handingData(response);
      ////print('this is the response : $response');
      ////print('the suer id is: $userId and the provider id is: $provId');
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          goToBookingMessage();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      ////print('No location data');
    }
  }

//cselect the date from the list
  @override
  void updateDate(text) {
    int i = 0;
    itemSelected = text;
    switch (itemSelected) {
      case "Today":
        i = 0;
        break;
      case "Tommorow":
        i = 1;
        break;
      case "This week":
        i = 7;
        break;
      case "Next week":
        i = 14;
        break;
      case "Next month":
        i = 30;
        break;
      default:
        i = 0; // Default value if none of the cases match
        break;
    }
    DateTime currentDate = DateTime.now();
    dateSelected =
        DateFormat('dd/MM/yyyy').format(currentDate.add(Duration(days: i)));

    update();
  }

  // Get the current location
  /*void getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    currentLocation = locationData;
    update();
  }*/

  void getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Handle location permission denied
        // Show appropriate error message or dialog
        return;
      }

      Position position = await Geolocator.getCurrentPosition();

      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      currentLocation.value =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';

      // Reverse geocoding to get the city and province information
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        currentCity.value = placemarks[0].locality ?? '';
        currentProvince.value = placemarks[0].administrativeArea ?? '';
        currentStreet.value = placemarks[0].street ?? '';
        adress = '$currentStreet,$currentCity';
      }
    } catch (e) {
      // Handle any errors
      // //print('Error: $e');
    }
    update();
  }

// choose Location from the map
  @override
  Future<void> chooseLocationFromMap() async {
    // Show the map screen and wait for the result
    dynamic result = await Get.to(const MapScreen());

    // Handle the selected location or null
    if (result != null && result is LatLng) {
      LatLng selectedLocation = result;

      latitude = selectedLocation.latitude.toString();
      longitude = selectedLocation.longitude.toString();

      ////print('Selected Location: $latitude   $longitude');
      currentLocation.value = 'Latitude: $latitude, Longitude: $longitude';
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.parse(latitude), double.parse(longitude));

      if (placemarks.isNotEmpty) {
        currentCity.value = placemarks[0].locality ?? '';
        currentProvince.value = placemarks[0].administrativeArea ?? '';
        currentStreet.value = placemarks[0].street ?? '';
        adress = '$currentStreet,$currentCity';

        // //print('City: $currentStreet, City: $currentCity');
        adress = '$currentStreet,$currentCity';
      }
    } else {
      Get.snackbar(
        'Location',
        'No location selected',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
    update();
  }

  // continue to the next screen
  @override
  goToBookingMessage() {
    Get.offNamed(ConsRoutes.bookingMessage, arguments: {});
  }

  @override
  goToBookinSummary() {
    Get.toNamed(ConsRoutes.bookingSummary, arguments: {});
  }

  @override
  goToProblemDescription() {
    Get.toNamed(ConsRoutes.problemDescriptionScreen, arguments: {});
  }
}
