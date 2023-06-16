import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ReviewsByProviderViewData {
  Crud crud;
  ReviewsByProviderViewData(this.crud);

  getReviewsByProviderViewData(String provId) async {
    var response = await crud.postData(Links.reviewsView, {"provId": provId});
    return response.fold((l) => l, (r) => r);
  }
}
