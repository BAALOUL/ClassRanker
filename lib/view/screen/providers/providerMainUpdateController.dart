import 'package:get/get.dart';

abstract class ProviderMainUpdateController extends GetxController {
  getData(String pid);
  initData();
}

class ProviderMainUpdateControllerImp extends ProviderMainUpdateController {
  @override
  getData(String pid) {
    throw UnimplementedError();
  }

  @override
  initData() {
    throw UnimplementedError();
  }
}
