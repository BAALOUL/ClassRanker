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

  String? pageId;
  // String? pageId = message.data['pageid'];
  late String? bookingId;
  late String? bookingProviderId;
  late String? serviceName;
  late String? username;
  late String? bookingDate;
  late String? bookingAddress;
  late String? demandstatus = "";

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

  void navigateToAppropriateScreen(Map<String, dynamic> arguments) {
    String? bookingStatus = arguments['booking_status'];

    switch (bookingStatus) {
      case 'pending':
        Get.toNamed(ConsRoutes.bookingDecision, arguments: arguments);
        break;
      case 'current':
        Get.toNamed(ConsRoutes.providerAnswer, arguments: arguments);
        break;
      case 'rejected':
        Get.toNamed(ConsRoutes.providerAnswer, arguments: arguments);
        break;
      default:
        Get.toNamed(ConsRoutes.providerAnswer, arguments: arguments);
        break;
      // Handle other cases here
      // Do something else
    }
  }

  void configureFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String? pageId = message.data['pageid'];
      // String? pageId = message.data['pageid'];
      bookingId = message.data['booking_id'];
      bookingProviderId = message.data['booking_provider_id'];
      serviceName = message.data['service_name'];
      username = message.data['username'];
      bookingDate = message.data['booking_date'];
      bookingAddress = message.data['booking_address'];
      demandstatus = message.data['booking_status'];
      print('The status onMessage is -----------        : $demandstatus');
      // Do something with the received data
      // For example, navigate to the booking details screen
      navigateToAppropriateScreen({
        'booking_id': bookingId,
        'booking_provider_id': bookingProviderId,
        'service_name': serviceName,
        'username': username,
        'booking_date': bookingDate,
        'booking_address': bookingAddress,
        'booking_status': demandstatus,
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      pageId = message.data['pageid'];
      bookingId = message.data['booking_id'];
      bookingProviderId = message.data['booking_provider_id'];
      serviceName = message.data['service_name'];
      username = message.data['username'];
      bookingDate = message.data['booking_date'];
      bookingAddress = message.data['booking_address'];
      demandstatus = message.data['booking_status'];
      print('The status is        : $demandstatus');

      print(bookingAddress);
      // Do something with the received data
      // For example, navigate to the booking details screen
      navigateToAppropriateScreen({
        'booking_id': bookingId,
        'booking_provider_id': bookingProviderId,
        'service_name': serviceName,
        'username': username,
        'booking_date': bookingDate,
        'booking_address': bookingAddress,
        'booking_status': demandstatus,
      });
      // }
    });
  }

  @override
  tokenUpdate() async {
    statusRequest = StatusRequest.loading;
    var response = await tokenUpdateData.postTokenUpdate(userId, myToken);
    print(myToken);
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
