import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ProvidersByServiceViewData {
  Crud crud;
  ProvidersByServiceViewData(this.crud);

  getProvidersByServiceListData(String servId) async {
    var response =
        await crud.postData(Links.providersByService, {"serId": servId});
    return response.fold((l) => l, (r) => r);
  }
}
