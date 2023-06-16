import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/data/remote/reviews/addReviewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/functions/handingDataController.dart';

class AddReviewController extends GetxController {
  AddReviewData addReviewData = AddReviewData(Get.find());
  late StatusRequest statusRequest;
  // Define observables
  late String userId = '';
  late String providerId = '';
  RxInt rating = RxInt(5);
  RxString comment = RxString('');

  // Set the selected rating
  void setRating(int value) {
    rating.value = value;
    update();
  }

  // Set the comment
  void setComment(String value) {
    comment.value = value;
  }

  // Submit the review
  void submitReview() async {
    statusRequest = StatusRequest.loading;
    //print('userId: $userId providerId: $providerId rating: ${rating.toString()} coment:   ${comment.toString()}');
    var response = await addReviewData.postReviewdate(
        userId, providerId, rating.toString(), comment.toString());
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //ordersList.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

    // Reset the rating and comment after submitting the review
    rating.value = 5;
    comment.value = '';
    Get.offAllNamed(ConsRoutes.homescreen);
  }

  @override
  void onInit() {
    userId = Get.arguments['userId'];
    providerId = Get.arguments['providerId'];
    // print('the provider id in add review is : $providerId');
    super.onInit();
  }
}
