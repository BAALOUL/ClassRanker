import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/booking/bookingStatusUpdateData.dart';
import 'package:ecommerce_store/data/remote/orders/ordersByProviderData.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';

enum OrderStatus { all, completed, current, canceled, pending }

abstract class OrdersByProviderController extends GetxController {
  initData();
  getData();
  statusUpdate(String bookingId, String status, String selectedReason);
  goToBookingMessage();
  onStatusSelected(OrderStatus status);
  Future<void> refreshData();
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
      filteredOrders = ordersList;
    } else {
      filteredOrders = ordersList.where((booking) {
        return booking['booking_status'] == status.toString().split('.').last;
      }).toList();
    }
    selectedStatus = status;
    update();
  }

  @override
  getData() async {
    ordersList.clear();
    filteredOrders.clear();
    statusRequest = StatusRequest.loading;
    update();

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
    update();

    var response = await bookingStatusUpdateData.postBookingStatusUpdate(
        bookingId, status, selectedReason);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        onStatusSelected(selectedStatus);
        Get.offAllNamed(ConsRoutes.homeProvider);
      } else {
        Get.defaultDialog(title: "Warning".tr, middleText: "Error".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future<void> refreshData() async {
    await getData(); // Call the existing `getData()` method to refresh the data
  }
}
