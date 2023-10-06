import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class SearchStudentData {
  Crud crud;
  SearchStudentData(this.crud);

  getStudentsData() async {
    var response = await crud.postData(Links.searchStudent, {});
    return response.fold((l) => l, (r) => r);
  }
}
