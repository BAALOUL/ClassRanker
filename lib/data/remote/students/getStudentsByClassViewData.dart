import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class GetStudentsByClassViewData {
  Crud crud;
  GetStudentsByClassViewData(this.crud);

  getstudentByClassData(String className) async {
    var response = await crud
        .postData(Links.selectStudentsByClass, {"class_name": className});
    return response.fold((l) => l, (r) => r);
  }
}
