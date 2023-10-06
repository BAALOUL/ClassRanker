import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class SelectStudentByIdViewData {
  Crud crud;
  SelectStudentByIdViewData(this.crud);

  getstudentByIdData(String studentId) async {
    var response =
        await crud.postData(Links.selectStudentById, {"id": studentId});
    return response.fold((l) => l, (r) => r);
  }
}
