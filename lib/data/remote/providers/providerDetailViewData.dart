import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ProviderByIDViewData {
  Crud crud;
  ProviderByIDViewData(this.crud);

  getProviderDetailViewData(String provId) async {
    var response = await crud.postData(Links.providersByIdView,
        {"provId": provId}); // waiting for prepared link
    return response.fold((l) => l, (r) => r);
  }
}
