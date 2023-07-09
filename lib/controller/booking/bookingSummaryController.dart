import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/booking/bookingSummaryViewData.dart';
import 'package:get/get.dart';

abstract class BookingSummaryController extends GetxController {
  getData();
  goToServices();
}

class BookingSummaryControllerImp extends BookingSummaryController {
  BookingSummaryViewData bookingSummaryViewData =
      BookingSummaryViewData(Get.find());
  late StatusRequest statusRequest;
  List providersList = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await bookingSummaryViewData.getBookingSummary();
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        providersList.addAll(response['data']);
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

  @override
  goToServices() {
    // TODO: implement goToServices
    throw UnimplementedError();
  }

  @override
  initData() {
    // TODO: implement initData
    throw UnimplementedError();
  }
}
