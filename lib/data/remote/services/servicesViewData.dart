import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ServiceViewData {
  Crud crud;
  ServiceViewData(this.crud);

  getServicesViewData(String provId) async {
    var response =
        await crud.postData(Links.servicesView, {"providerId": provId});
    return response.fold((l) => l, (r) => r);
  }
}
