import 'dart:io';

import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/data/model/providerModel.dart';
import 'package:ecommerce_store/data/remote/booking/bookingUp.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../core/services/services.dart';
import '../../core/functions/handingDataController.dart';
import '../../links.dart';
import 'maScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

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
  late String serviceNameAr;
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

  void deletePhoto(int index) {
    selectedPhotos.removeAt(index);
    update();
  }

  void addPhoto(XFile? photo) async {
    if (photo != null) {
      // Create a new copy of the temporary file for each selected image
      File resizedPhoto = await copyXFile(photo);

      selectedPhotos.add(resizedPhoto);

      update();
    } else {
      // Handle the case where the photo is null
      print('Error: Photo is null');
    }
  }

  Future<File> copyXFile(XFile xfile) async {
    // Get the temporary directory
    Directory tempDir = await getTemporaryDirectory();
    // Create a new unique file name
    String tempFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    // Copy the XFile to the temporary directory with the new file name
    File tempFile = File('${tempDir.path}/$tempFileName');
    await tempFile.writeAsBytes(await xfile.readAsBytes());
    return tempFile;
  }

  void selectImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      XFile? xFile = XFile(pickedFile.path);
      // Resize the image before adding it to the controller's selectedPhotos list
      XFile? resizedPhoto = await resizeImages(xFile);

      if (resizedPhoto != null) {
        addPhoto(resizedPhoto);
        // No need to manually trigger an update since GetX's Obx widget will take care of it
      } else {
        // Handle the case when resizing fails
        print('Error resizing the image');
      }
    }
  }

  Future<XFile?> resizeImages(XFile? imageFile) async {
    if (imageFile == null) return null;

    final rawImage = await imageFile.readAsBytes();
    final bytes = await FlutterImageCompress.compressWithList(
      rawImage,
      minHeight: 150,
    );

    if (bytes != null) {
      // Save the resized image to a temporary file
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/temp_image.jpg');
      await tempFile.writeAsBytes(bytes);

      return XFile(tempFile.path); // Return the resized image as XFile
    } else {
      return null;
    }
  }

  /* Future<XFile?> compressImage(XFile? imageFile) async {
    if (imageFile == null) return null;

    // You can adjust the compression quality as needed (0 to 100)
    int quality = 70;

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        imageFile.path ?? '',
        imageFile.path ?? '',
        quality: quality,
      );
      return XFile(result?.path ?? '');
    } catch (e) {
      print('Compression error: $e');
      return null;
    }
  }*/

  // Method to send selectedPhotos to the API
  Future<void> uploadPhotosToApi(String booking_id) async {
    String apiUrl = Links.bookingImages;
    print("the selected photos are :  $selectedPhotos \n");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      print("the number of photos is : ${selectedPhotos.length}");
      for (int i = 0; i < selectedPhotos.length; i++) {
        var photo = selectedPhotos[i];
        // Get the file name from the path and use it as the name
        String fileName = photo.path.split('/').last;
        request.files.add(
          await http.MultipartFile.fromPath('booking_images[]', photo.path,
              filename: fileName),
        );
      }

      request.fields['booking_id'] = booking_id;

      var response = await request.send();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Photos uploaded successfully');
      } else {
        print('Failed to upload photos: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading photos: $e');
    }
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
    serviceNameAr = Get.arguments['serviceNameAr'] ?? "";
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
      print("sending...........");

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
          String bookingId;
          // Replace the print statement with this updated code
          print("s1 the response is :::::::: ${response['booking_id']}");
          if (response['booking_id'] != null) {
            String bookingId = response['booking_id'];
            print("booking id is : $bookingId");
          } else {
            print("booking id is null or does not exist in the response");
          }

          if (response != null && response['booking_id'] != null) {
            bookingId = response['booking_id'];

            print("\n s2 uploading");

            await uploadPhotosToApi(bookingId);
            goToBookingMessage();
          } else {}
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
      case "اليوم":
        i = 0;
        break;
      case "Tommorow":
      case "غدًا":
        i = 1;
        break;
      case "This week":
      case "هذا الأسبوع":
        i = 7;
        break;
      case "Next week":
      case "الأسبوع القادم":
        i = 14;
        break;
      case "Next month":
      case "الشهر القادم":
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
