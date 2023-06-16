import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ServiceProviderUpdateData {
  Crud crud;
  ServiceProviderUpdateData(this.crud);

  postServiceProviderUpdateDataUpdate(
      String providerId, String selectedServices) async {
    var response = await crud.postData(Links.serviceProviderUpdate, {
      "providerId": providerId,
      "serviceProviderList": selectedServices.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
