import 'package:classRanker/core/class/statusRequest.dart';

handingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
