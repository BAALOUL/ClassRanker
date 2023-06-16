import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class SelectServicesByProvider {
  Crud crud;
  SelectServicesByProvider(this.crud);

  getSelectServicesByProviderData(String provId) async {
    var response =
        await crud.postData(Links.selectServicesByProvider, {"provId": provId});
    return response.fold((l) => l, (r) => r);
  }
}
