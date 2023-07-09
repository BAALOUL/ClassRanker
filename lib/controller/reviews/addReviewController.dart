import 'dart:ffi';

import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/data/remote/reviews/addReviewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/functions/handingDataController.dart';

class AddReviewController extends GetxController {
  AddReviewData addReviewData = AddReviewData(Get.find());
  late StatusRequest statusRequest;
  // Define observables
  late String userId = '31';
  late String providerId = '9';
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
  void submitReview(double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();

    //print('userId: $userId providerId: $providerId rating: ${rating.toString()} coment:   ${comment.toString()}');
    var response = await addReviewData.postReviewdate(
        userId, providerId, rating.toString(), comment);
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

    Get.offAllNamed(ConsRoutes.homeProvider);
  }

  @override
  void onInit() {
    // userId = Get.arguments['userId'] ;
    //providerId = Get.arguments['providerId'];
    userId = '31';
    providerId = '9';
    // print('the provider id in add review is : $providerId');
    super.onInit();
  }
}
