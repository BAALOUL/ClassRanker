import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/reviews/reviewsViewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';
import '../../data/model/providerModel.dart';

abstract class ProviderByIdController extends GetxController {
  getData(String pid);
  initData();
  goToBooking(String serviceName, String serviceId);
  goToReview();
}

class ProviderByIdControllerImp extends ProviderByIdController {
  MyServices myServices = Get.find();
  ReviewsByProviderViewData reviewsByProviderViewData =
      ReviewsByProviderViewData(Get.find());
  late StatusRequest statusRequest;
  List reviewsList = [];

  late String provId;
  late String currentRoute;
  late String userId;
  late String serviceId;
  late ProviderModel providerModel;
  late String serviceName;

  @override
  getData(pid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await reviewsByProviderViewData.getReviewsByProviderViewData(pid);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        reviewsList.addAll(response['data']);
        print("list of revies +++++++++++++++++++++: $reviewsList");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    // get the user id
    print("step 1 init");
    userId = myServices.sharedPreferences.get('userId').toString();
    providerModel = Get.arguments['provider_model'];
    serviceName = Get.arguments['serviceName'];
    serviceId = Get.arguments['serviceId'];

    provId = providerModel.providerid!;

    currentRoute = Get.currentRoute;
    print("step 2 current route $currentRoute");
    getData(provId);
  }

  @override
  goToBooking(serviceName, serviceId) {
    Get.toNamed(ConsRoutes.booking, arguments: {
      "provider_model": providerModel,
      "userId": userId,
      "serviceName": serviceName,
      "serviceId": serviceId
    });
  }

  @override
  goToReview() {}
}
