import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ServiceCatViewData {
  Crud crud;
  ServiceCatViewData(this.crud);

  getServicesCatViewData(String sectId) async {
    var response =
        await crud.postData(Links.servicesByCatView, {"sectId": sectId});
    return response.fold((l) => l, (r) => r);
  }
}
