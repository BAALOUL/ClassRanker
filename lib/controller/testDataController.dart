import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/test_data.dart';
import 'package:get/get.dart';

class TestDataController extends GetxController {
  TestData testData = TestData(Get.find());
  late StatusRequest statusRequest;
  List data = [];
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
