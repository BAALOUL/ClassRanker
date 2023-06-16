import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class BookingSummaryViewData {
  Crud crud;
  BookingSummaryViewData(this.crud);

  getBookingSummary() async {
    var response = await crud.postData(Links.providersView, {}); //todo:
    return response.fold((l) => l, (r) => r);
  }
}
