import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class GetStudentsListData {
  Crud crud;
  GetStudentsListData(this.crud);

  getstudentListData() async {
    var response = await crud.postData(Links.getStudentsList, {});
    return response.fold((l) => l, (r) => r);
  }
}
