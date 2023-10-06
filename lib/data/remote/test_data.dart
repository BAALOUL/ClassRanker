import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(Links.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
