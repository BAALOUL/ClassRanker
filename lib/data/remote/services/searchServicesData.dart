import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class SearchServicesData {
  Crud crud;
  SearchServicesData(this.crud);

  getServicesData(String search) async {
    var response =
        await crud.postData(Links.searchServices, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
