import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/data/remote/booking/bookingStatusUpdateData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/consRoutes.dart';
import '../../core/functions/handingDataController.dart';

abstract class BookingDecisionController extends GetxController {
  bookingStatus(String status);
  initData();
}

class BookingDecisionControllerImp extends BookingDecisionController {
  BookingStatusUpdateData bookingStatusUpdateData =
      BookingStatusUpdateData(Get.find());
  late StatusRequest statusRequest;
  List providersList = [];
  late String bookingId = "";
  late String bookingProviderId = "";
  late String serviceName = "";
  late String username = "";
  late String bookingDate = "";
  late String bookingAddress = "";
  late String demandStatus = "";
  late String selectedReason = '';

  @override
  bookingStatus(status) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await bookingStatusUpdateData.postBookingStatusUpdate(
        bookingId, status, selectedReason);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (status == 'current') {
          Get.snackbar(
            'Service demand accepted',
            'The service demand has been accepted.',
            backgroundColor: const Color.fromARGB(255, 62, 185, 84),
          );
        } else if (status == 'rejected') {
          Get.snackbar(
            'Service demand rejected',
            'The service demand has been rejected.',
            backgroundColor: const Color.fromARGB(255, 185, 62, 62),
          );
        }
        Get.offAllNamed(ConsRoutes.homeProvider);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    var arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      bookingId = arguments['booking_id'];
      bookingProviderId = arguments['booking_provider_id'];
      serviceName = arguments['service_name'];
      username = arguments['username'];
      bookingDate = arguments['booking_date'];
      bookingAddress = arguments['booking_address'];
      demandStatus = arguments['booking_status'];
      print("Id: $bookingId, date: $bookingDate, status: $demandStatus");
    }
  }
}
