import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class SectionsAndServicesViewData {
  Crud crud;
  SectionsAndServicesViewData(this.crud);

  getSectionsAndServicesData() async {
    var response = await crud.postData(Links.sectionsAndServicesView, {});
    return response.fold((l) => l, (r) => r);
  }
}
