import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class IsProviderData {
  Crud crud;
  IsProviderData(this.crud);

  getIsProviderData(String userId) async {
    var response = await crud.postData(Links.isProvider, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
