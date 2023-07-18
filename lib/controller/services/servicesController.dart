import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/services/servicesCatViewData.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

abstract class ServicesController extends GetxController {
  initData();
  getData(String sect);
  //goToDetails(PropertiesModel propertiesModel);
  geToProviders(String servID, String serviceName, String serviceNameAr);
}

class ServicesControllerImp extends ServicesController {
  MyServices myServices = Get.find();
  late String mode;
  ServiceCatViewData servicesCatViewData = ServiceCatViewData(Get.find());
  late StatusRequest statusRequest;
  List servicesList = [];
  late String serviceName;
  late String sectid;
  late String sectionName;
  late String sectionNameAr;
  @override
  initData() {
    sectid = Get.arguments['sectionId'];
    sectionName = Get.arguments['sectionName'];
    sectionNameAr = Get.arguments['sectionNameAr'];
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
    update();

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
  geToProviders(servID, serviceName, serviceNameAr) {
    Get.toNamed(ConsRoutes.providersView, arguments: {
      "serviceID": servID,
      "serviceName": serviceName,
      "serviceNameAr": serviceNameAr
    });

    /* geToProviders(servID, serviceName, serviceNameAr) {
    if (mode == "" || mode == "guestMode") {
      Get.toNamed(ConsRoutes.loginScrren);
    } else {
      Get.toNamed(ConsRoutes.providersView, arguments: {
        "serviceID": servID,
        "serviceName": serviceName,
        "serviceNameAr": serviceNameAr
      });
    }
  }*/
  }
}
