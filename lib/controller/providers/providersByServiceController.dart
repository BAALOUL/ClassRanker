import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/providers/providersByServiceViewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../data/model/providerModel.dart';

abstract class ProviderByServiceController extends GetxController {
  initData();
  getData(String serid);
  goToProviderDetails(ProviderModel providerModel, String serviceName);
}

class ProviderByServiceControllerImp extends ProviderByServiceController {
  ProvidersByServiceViewData providersByServiceViewData =
      ProvidersByServiceViewData(Get.find());
  late StatusRequest statusRequest;
  List providersList = [];
  late String serid;
  late String serviceName;
  late ProviderModel providerModel;
  @override
  initData() {
    serid = Get.arguments['serviceID'];
    serviceName = Get.arguments['serviceName'];
    getData(serid);
  }

  @override
  getData(serid) async {
    statusRequest = StatusRequest.loading;
    var response =
        await providersByServiceViewData.getProvidersByServiceListData(serid);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        providersList.addAll(response['data']);
        providerModel = ProviderModel.fromJson(response['data'][0]);
        //print('///////////////        ${providerModel.providername}');
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
  goToProviderDetails(providerModel, serviceName) {
    Get.toNamed(ConsRoutes.providerDetailView, arguments: {
      "provider_model": providerModel,
      "serviceName": serviceName,
      "serviceId": serid
    });
  }
}
