import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/homeData.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  chooseRequest();
  goToProperties(List catProperties, int selectedCat, String catid);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  String? username;
  late StatusRequest statusRequest;
  List properties = [];
  List categories = [];

  @override
  initialData() {}

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getHomeData();
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        properties.addAll(response['properties']);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  chooseRequest() {}

  @override
  goToProperties(catProperties, selectedCat, catid) {
    Get.toNamed(ConsRoutes.properties, arguments: {
      "categories": catProperties,
      "selectedcat": selectedCat,
      "catid": catid
    });
  }
}
