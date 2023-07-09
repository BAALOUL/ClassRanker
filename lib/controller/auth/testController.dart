import 'package:get/get.dart';

class TestController extends GetxController {
  late String token = '';
  void printToken(String token) {
    print("Token is : $token");
  }

  @override
  void onInit() {
    printToken(token);
    super.onInit();
  }
}
