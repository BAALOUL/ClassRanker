import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/services/servicesCatViewData.dart';
import 'package:get/get.dart';

abstract class ServicesController extends GetxController {
  initData();
  getData(String sect);
  //goToDetails(PropertiesModel propertiesModel);
  geToProviders(String servID, String serviceName);
}

class ServicesControllerImp extends ServicesController {
  ServiceCatViewData servicesCatViewData = ServiceCatViewData(Get.find());
  late StatusRequest statusRequest;
  List servicesList = [];
  late String serviceName;
  late String sectid;
  late String sectionName;
  @override
  initData() {
    sectid = Get.arguments['sectionId'];
    sectionName = Get.arguments['sectionName'];
    getData(sectid);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  getData(sect) async {
    servicesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await servicesCatViewData.getServicesCatViewData(sect);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        servicesList.addAll(response['data']);
        ////print("controller");
      } else {
        //Get.defaultDialog(title: "ُWarning", middleText: "No Data");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  geToProviders(servID, serviceName) {
    Get.toNamed(ConsRoutes.providersView,
        arguments: {"serviceID": servID, "serviceName": serviceName});
  }
}
