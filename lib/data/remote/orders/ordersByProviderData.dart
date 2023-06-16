import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class OrdersByProviderData {
  Crud crud;
  OrdersByProviderData(this.crud);

  getOrdersByProviderListData(String provId) async {
    var response =
        await crud.postData(Links.ordersByProvider, {"provId": provId});
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
// todo:
