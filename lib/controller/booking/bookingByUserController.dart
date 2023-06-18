import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/booking/bookingStatusUpdateData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';
import '../../data/remote/booking/bookingByUserData.dart';

enum BookingStatus { all, completed, current, canceled, rejcted, pending }

abstract class BookingsByUserController extends GetxController {
  initData();
  getData();
  statusUpdate(String bookingId, String status, String providerid);
  goToBookingMessage();
  onStatusSelected(BookingStatus status);
  goToReview(String providerId);
}

class BookingsByUserControllerImp extends BookingsByUserController {
  BookingByUserData bookingByUserData = BookingByUserData(Get.find());
  BookingStatusUpdateData bookingStatusUpdateData =
      BookingStatusUpdateData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;
  late String userId;
  List bookingsList = [];
  List<dynamic> filteredBookings = [];

  // Selected status property
  BookingStatus selectedStatus = BookingStatus.all;

  // Method called when a segment is tapped
  @override
  void onStatusSelected(BookingStatus status) {
    if (status == BookingStatus.all) {
      // If "All" status is selected, show all bookings
      filteredBookings = bookingsList;
    } else {
      // Filter bookings based on selected status
      filteredBookings = bookingsList.where((booking) {
        return booking['booking_status'] == status.toString().split('.').last;
      }).toList();
    }
    //print("status from DB: $bookingsList['booking_status']\n" "status from DB: ${status.toString()}");
    selectedStatus = status;
    update(); // Notify the view to update the displayed bookings
  }

  @override
  getData() async {
    bookingsList.clear();
    filteredBookings.clear();
    statusRequest = StatusRequest.loading;
    var response = await bookingByUserData.getBookingsByUserListData(userId);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        bookingsList.addAll(response['data']);
        filteredBookings = bookingsList;
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
    userId = myServices.sharedPreferences.get('userId').toString();
    //userId = "37";
  }

  @override
  statusUpdate(bookingId, status, providerid) async {
    //print("Boooooooking Id : $bookingId \n Status :  $status\n");
    statusRequest = StatusRequest.loading;
    update();
    var response = await bookingStatusUpdateData.postBookingStatusUpdate(
        bookingId, status);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
        /*Get.defaultDialog(
          title: "Status updated successfully",
          content: const Text(""),
        );*/
        // print('the provider Id : $providerid');
        goToReview(providerid);
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Error");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToReview(providerId) {
    Get.offAll(ConsRoutes.addReview,
        arguments: {"userId": userId, "providerId": providerId});
  }
}
