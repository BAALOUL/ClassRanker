import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class PropertiesData {
  Crud crud;
  PropertiesData(this.crud);

  getPropertiesData(String cat) async {
    var response =
        await crud.postData(Links.propertiesItems, {"categoryType": cat});
    return response.fold((l) => l, (r) => r);
  }
}
