import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class GetProviderIdData {
  Crud crud;
  GetProviderIdData(this.crud);

  getProviderIdData(String userId) async {
    var response = await crud.postData(Links.getProviderId, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
