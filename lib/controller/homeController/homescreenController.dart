import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/remote/auth/tokenUpdateData.dart';
import 'package:ecommerce_store/view/screen/booking/bookingsByUserView.dart';
import 'package:ecommerce_store/view/screen/orders/ordersByProviderView.dart';
import 'package:ecommerce_store/view/screen/services/sectionsView.dart';
import 'package:ecommerce_store/view/screen/settings/settingsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
  tokenUpdate();
}

class HomeScreenControllerImp extends HomeScreenController {
  TokenUpdateData tokenUpdateData = TokenUpdateData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late FirebaseMessaging _firebaseMessaging;
  late String userId;
  late String myToken = '';
  int currentPage = 0;
  List<Widget> listPages = [
    const SectionsView(),
    const BookingsByUserView(),
    const OrdersByProviderView(),
    const SettingsView(),
  ];

  List<String> buttonBottomAppBar = ["Home", "Bookings", "Orders", "Settings"];
  List<IconData> listIconBottomAppBar = [
    Icons.home,
    Icons.book,
    Icons.person,
    Icons.settings
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    userId = myServices.sharedPreferences.get('userId').toString();
    FirebaseMessaging.instance.subscribeToTopic("users");
    _firebaseMessaging = FirebaseMessaging.instance;
    getToken();
    configureFCM();
  }

  Future<void> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    myToken = token.toString();
    tokenUpdate();
  }

  void configureFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String? pageId = message.data['pageid'];
      // String? pageId = message.data['pageid'];
      String? bookingId = message.data['booking_id'];
      String? bookingProviderId = message.data['booking_provider_id'];
      String? serviceName = message.data['service_name'];
      String? username = message.data['username'];
      String? bookingDate = message.data['booking_date'];
      String? bookingAddress = message.data['booking_address'];

      // Do something with the received data
      // For example, navigate to the booking details screen
      Get.toNamed(
        ConsRoutes.bookingDecision,
        arguments: {
          'booking_id': bookingId,
          'booking_provider_id': bookingProviderId,
          'service_name': serviceName,
          'username': username,
          'booking_date': bookingDate,
          'booking_address': bookingAddress,
        },
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification when the app is opened from a terminated state or background
      // String? pageId = message.data['pageid'];
      // if (pageId == "1") {
      String? pageId = message.data['pageid'];
      // String? pageId = message.data['pageid'];
      String? bookingId = message.data['booking_id'];
      String? bookingProviderId = message.data['booking_provider_id'];
      String? serviceName = message.data['service_name'];
      String? username = message.data['username'];
      String? bookingDate = message.data['booking_date'];
      String? bookingAddress = message.data['booking_address'];

      print(bookingAddress);
      // Do something with the received data
      // For example, navigate to the booking details screen
      Get.toNamed(
        ConsRoutes.bookingDecision,
        arguments: {
          'booking_id': bookingId,
          'booking_provider_id': bookingProviderId,
          'service_name': serviceName,
          'username': username,
          'booking_date': bookingDate,
          'booking_address': bookingAddress,
        },
      );
      // }
    });
  }

  @override
  tokenUpdate() async {
    statusRequest = StatusRequest.loading;
    var response = await tokenUpdateData.postTokenUpdate(userId, myToken);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
