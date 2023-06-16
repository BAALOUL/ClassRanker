import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class AddReviewData {
  Crud crud;
  AddReviewData(this.crud);

  postReviewdate(
      String userId, String providerId, String rating, String comment) async {
    var response = await crud.postData(Links.addReviews, {
      "userId": userId,
      "providerId": providerId,
      "rating": rating,
      "comment": comment
    });
    return response.fold((l) => l, (r) => r);
  }
}
