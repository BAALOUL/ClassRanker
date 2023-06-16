import 'package:ecommerce_store/core/class/statusRequest.dart';

handingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
