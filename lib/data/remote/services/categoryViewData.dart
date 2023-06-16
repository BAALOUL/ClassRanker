import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class CategoryViewData {
  Crud crud;
  CategoryViewData(this.crud);

  getCategoryViewData(String sectId) async {
    var response =
        await crud.postData(Links.categoryView, {"sectionId": sectId});
    return response.fold((l) => l, (r) => r);
  }
}
