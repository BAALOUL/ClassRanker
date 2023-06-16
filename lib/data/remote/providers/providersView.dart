import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ProvidersViewData {
  Crud crud;
  ProvidersViewData(this.crud);

  getProvidersListData() async {
    var response = await crud.postData(Links.providersView, {});
    return response.fold((l) => l, (r) => r);
  }
}
