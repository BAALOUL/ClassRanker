import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/model/propertiesModels.dart';
import 'package:ecommerce_store/data/remote/properties/propertiesData.dart';
import 'package:get/get.dart';

abstract class PropertiesController extends GetxController {
  initData();
  changeCategories(int val);
  getData(String cat);
  goToDetails(PropertiesModel propertiesModel);
}

class PropertiesControllerImp extends PropertiesController {
  PropertiesData propertiesData = PropertiesData(Get.find());
  late StatusRequest statusRequest;
  List categories = [];
  List properties = [];
  int? selectedcat;
  late String catid;
  @override
  initData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getData(catid);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  changeCategories(val) {
    selectedcat = val;
    getData(categories[val]['name_en_categories']);
    update();
  }

  @override
  getData(cat) async {
    properties.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertiesData.getPropertiesData(cat);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        properties.addAll(response['data']);
      } else {
        //Get.defaultDialog(title: "ُWarning", middleText: "No Data");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToDetails(propertiesModel) {
    Get.toNamed(ConsRoutes.propertiesDetails,
        arguments: {'propertiesmodel': propertiesModel});
  }
}
