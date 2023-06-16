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

  List buttonBottomAppBar = ["Home", "Bookings", "Orders", "Settings"];
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
    getToken(); // Get the initial token
    configureFCM(); // Configure Firebase Cloud Messaging callbacks
  }

  Future<void> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    myToken = token.toString();
    tokenUpdate();
    // Do something with the token, such as sending it to your server
  }

  void configureFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming messages when the app is in the foreground
      ////print('FCM Message received: ${message.notification?.body}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the tap on the notification when the app is in the background or terminated
      ////print('FCM Message opened: ${message.notification?.body}');
    });
  }

  @override
  tokenUpdate() async {
    statusRequest = StatusRequest.loading;
    var response = await tokenUpdateData.postTokenUpdate(userId, myToken);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //categoryList.addAll(response['data']);
        ////print('the result is : $response');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
