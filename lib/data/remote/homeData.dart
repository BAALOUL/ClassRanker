import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getHomeData() async {
    var response = await crud.postData(Links.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
