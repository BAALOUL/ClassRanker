import 'package:ecommerce_store/core/services/services.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handingDataController.dart';
import '../../../../data/model/provUserModel.dart';
import '../../../../data/remote/providers/providerDetailViewData.dart';

abstract class ProviderContactsController extends GetxController {
  initData();
  getData();
}

class ProviderContactsControllerImp extends ProviderContactsController {
  MyServices myServices = Get.find();
  ProviderByIDViewData providerByIDViewData = ProviderByIDViewData(Get.find());

  late String provId;

  late StatusRequest statusRequest = StatusRequest.none;

  ProvUserModel? providerModel; // Make providerModel nullable

  @override
  initData() {
    print("initialization");
    provId = Get.arguments['ProviderId'];
    getData(); // Call the getData method here
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await providerByIDViewData.getProviderDetailViewData(provId);
    print("response is: $response");
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response is Map<String, dynamic>) {
        // If response is a Map, retrieve the data directly
        var data = response['data'] as List<dynamic>;
        if (data.isNotEmpty) {
          providerModel = ProvUserModel.fromJson(data[0]);
        }
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
}
