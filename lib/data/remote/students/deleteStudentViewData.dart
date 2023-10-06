import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class DeleteStudentViewData {
  Crud crud;
  DeleteStudentViewData(this.crud);

  deleteStudentViewData(String studentId) async {
    var response =
        await crud.postData(Links.deleteStudent, {"student_id": studentId});
    return response.fold((l) => l, (r) => r);
  }
}
