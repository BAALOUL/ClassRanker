import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/remote/auth/tokenUpdateData.dart';
import 'package:ecommerce_store/data/remote/providers/isProviderData.dart';
import 'package:ecommerce_store/view/screen/booking/bookingsByUserView.dart';
import 'package:ecommerce_store/view/screen/orders/ordersByProviderView.dart';
import 'package:ecommerce_store/view/screen/otp/loginScreen.dart';
import 'package:ecommerce_store/view/screen/services/sectionsView.dart';
import 'package:ecommerce_store/view/screen/settings/settingsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handingDataController.dart';

abstract class HomeGuestController extends GetxController {
  changePage(int currentpage);
}

class HomeGuestControllerImp extends HomeGuestController {
  TokenUpdateData tokenUpdateData = TokenUpdateData(Get.find());
  IsProviderData isProviderData = IsProviderData(Get.find());

  MyServices myServices = Get.find();
  late String mode;
  late StatusRequest statusRequest;
  late String userId;
  int currentPage = 0;

  List<Widget> listPages = [
    SectionsView(),
    LoginScreen(),
    LoginScreen(),
    SettingsView(),
  ];

  List<String> buttonBottomAppBar = [
    "Home".tr,
    "Bookings".tr,
    "Messages".tr,
    "Settings".tr,
  ];
  List<IconData> listIconBottomAppBar = [
    Icons.home,
    Icons.book,
    Icons.message,
    Icons.settings,
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    mode = "";
  }
}
