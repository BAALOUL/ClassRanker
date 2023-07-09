import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/data/remote/reviews/addReviewData.dart';
import 'package:get/get.dart';
import '../../core/functions/handingDataController.dart';
import '../../data/remote/reviews/reviewsViewData.dart';

class ReviewsController extends GetxController {
  ReviewsByProviderViewData reviewsByProviderViewData =
      ReviewsByProviderViewData(Get.find());

  late StatusRequest statusRequest;
  List reviewsList = [];

  getData(String pid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await reviewsByProviderViewData.getReviewsByProviderViewData(pid);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        reviewsList.addAll(response['data']);
        //print("list of revies : $reviewsList");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
