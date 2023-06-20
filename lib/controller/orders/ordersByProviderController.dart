import 'package:flutter/material.dart';

import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/booking/bookingStatusUpdateData.dart';
import 'package:ecommerce_store/data/remote/orders/ordersByProviderData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';

enum OrderStatus { all, completed, current, canceled, rejected, pending }

abstract class OrdersByProviderController extends GetxController {
  initData();
  getData();
  statusUpdate(String bookingId, String status, String selectedReason);
  goToBookingMessage();
  onStatusSelected(OrderStatus status);
}

class OrdersByProviderControllerImp extends OrdersByProviderController {
  OrdersByProviderData ordersByProviderData = OrdersByProviderData(Get.find());
  BookingStatusUpdateData bookingStatusUpdateData =
      BookingStatusUpdateData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;
  late String provId;
  List ordersList = [];
  List<dynamic> filteredOrders = [];

  // Selected status property
  OrderStatus selectedStatus = OrderStatus.all;

  // Method called when a segment is tapped
  @override
  void onStatusSelected(OrderStatus status) {
    if (status == OrderStatus.all) {
      // If "All" status is selected, show all bookings
      filteredOrders = ordersList;
    } else {
      // Filter bookings based on selected status
      filteredOrders = ordersList.where((booking) {
        return booking['booking_status'] == status.toString().split('.').last;
      }).toList();
    }

    //getData();
    selectedStatus = status;
    update(); // Notify the view to update the displayed bookings
  }

  @override
  getData() async {
    ordersList.clear();
    filteredOrders.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await ordersByProviderData.getOrdersByProviderListData(provId);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        ordersList.addAll(response['data']);
        filteredOrders = ordersList;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    getData();
    super.onInit();
  }

  @override
  goToBookingMessage() {
    Get.toNamed(ConsRoutes.bookingMessage, arguments: {});
  }

  @override
  initData() {
    provId = myServices.sharedPreferences.get('providerId').toString();
  }

  @override
  statusUpdate(bookingId, status, selectedReason) async {
    statusRequest = StatusRequest.loading;
    //update();
    var response = await bookingStatusUpdateData.postBookingStatusUpdate(
        bookingId, status, selectedReason);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //getData();
        onStatusSelected(selectedStatus);
        /*Get.defaultDialog(
          title: "Status $status successfully",
          content: const Text("Custom Content"),
        );*/
        Get.offAllNamed(ConsRoutes.homescreen);
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Error");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
