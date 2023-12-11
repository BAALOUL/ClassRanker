import 'package:classRanker/links.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FilterStatus { upcoming, complete, cancel }

class AppointmentsControllerImp extends GetxController {
  List<dynamic> schedules = [];
  FilterStatus status = FilterStatus.upcoming; // Standard enum-based status

  // Store booking details
  Future<void> getAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final response = await Dio().get(
      Links.appointments,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final appointment = response.data as List<dynamic>;

    if (appointment.isNotEmpty) {
      schedules = appointment; // Update the list directly
      update(); // Notify GetX to refresh the UI
    }
    update();
  }

  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }

  void changeStatus(FilterStatus newStatus) {
    status = newStatus;
    update(); // Notify GetX to refresh the UI
  }

  Alignment alignmentForStatus(FilterStatus status) {
    if (status == FilterStatus.upcoming) {
      return Alignment.centerLeft;
    } else if (status == FilterStatus.complete) {
      return Alignment.center;
    } else if (status == FilterStatus.cancel) {
      return Alignment.centerRight;
    } else {
      // Return a default alignment if the status is not recognized
      return Alignment.center;
    }
  }
}
