import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class GetStudentsListData {
  Crud crud;
  GetStudentsListData(this.crud);

  getstudentListData(String page) async {
    var response = await crud.postData(Links.getStudentsList, {"page": page});
    return response.fold((l) => l, (r) => r);
  }
}
