import 'dart:ffi';

import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class BookingUp {
  Crud crud;
  BookingUp(this.crud);

  postBooking(
      String bookingUserId,
      String bookingProviderId,
      String bookingServiceId,
      String bookingDate,
      String bookingStatus,
      String bookingLatitude,
      String bookingLongitude,
      String bookingAppartment,
      String bookingFloor,
      String bookingHouseN,
      String bookingAdress,
      String description) async {
    var response = await crud.postData(Links.bookingUp, {
      "booking_user_id": bookingUserId,
      "booking_provider_id": bookingProviderId,
      "booking_service_id": bookingServiceId,
      "booking_date": bookingDate,
      "booking_status": bookingStatus,
      "booking_latitude": bookingLatitude,
      "booking_longitude": bookingLongitude,
      "booking_appartment": bookingAppartment,
      "booking_floor": bookingFloor,
      "booking_houseN": bookingHouseN,
      "booking_adress": bookingAdress,
      "booking_description": description
    });
    return response.fold((l) => l, (r) => r);
  }
}
