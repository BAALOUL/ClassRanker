import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:get/get.dart';

import '../../data/remote/services/categoryViewData.dart';

abstract class CategoryController extends GetxController {
  initData();
  getData(String sectionId);
  goToServices(String catID);
}

class CategoryControllerImp extends CategoryController {
  CategoryViewData categoryView = CategoryViewData(Get.find());
  late StatusRequest statusRequest;
  late String sectID;
  List categoryList = [];

  @override
  initData() {
    sectID = Get.arguments['sectionId'];
    getData(sectID);
  }

  @override
  getData(sectionId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await categoryView.getCategoryViewData(sectionId);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categoryList.addAll(response['data']);
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
  goToServices(catID) {
    Get.toNamed(ConsRoutes.servicesView, arguments: {
      "categoryId": catID,
    });
  }
}
