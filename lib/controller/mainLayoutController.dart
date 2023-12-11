import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainLayoutController extends GetxController {
  int currentPage = 0;
  final PageController pageController = PageController();

  void changePage(int value) {
    currentPage = value;
    print('Current page is:     ($currentPage)');
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
