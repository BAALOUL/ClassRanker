import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class BookingStatusUpdateData {
  Crud crud;
  BookingStatusUpdateData(this.crud);

  postBookingStatusUpdate(String bookingId, String bookingStatus) async {
    var response = await crud.postData(Links.bookingStatusUpdate, {
      "booking_id": bookingId,
      "booking_status": bookingStatus,
    });
    return response.fold((l) => l, (r) => r);
  }
}
