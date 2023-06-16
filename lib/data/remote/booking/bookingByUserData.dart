import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class BookingByUserData {
  Crud crud;
  BookingByUserData(this.crud);

  getBookingsByUserListData(String userId) async {
    var response = await crud.postData(Links.bookingByUser, {"userId": userId});

    return response.fold((l) => l, (r) => r);
  }
}
// todo:
