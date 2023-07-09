import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/remote/services/sectionsViewData.dart';
import 'package:get/get.dart';

abstract class SectionsController extends GetxController {
  getData();
  goToCategories(String sectionId);
  goToServices(String sectID, String sectionName);
}

class SectionsControllerImp extends SectionsController {
  SectionsViewData sectionsView = SectionsViewData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List sectionsList = [];
  late String username;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await sectionsView.getSectionsListData();
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        sectionsList.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    username = myServices.sharedPreferences.getString("username")!;
    getData();
    super.onInit();
  }

  @override
  goToCategories(sectionId) {
    Get.toNamed(ConsRoutes.categoryView, arguments: {
      "sectionId": sectionId,
    });
  }

  @override
  initData() {}

  @override
  goToServices(sectID, sectionName) {
    Get.toNamed(ConsRoutes.servicesView,
        arguments: {"sectionId": sectID, "sectionName": sectionName});
  }
}
