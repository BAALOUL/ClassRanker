import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class SectionsViewData {
  Crud crud;
  SectionsViewData(this.crud);

  getSectionsListData() async {
    var response = await crud.postData(Links.sectionsView, {});
    return response.fold((l) => l, (r) => r);
  }
}
