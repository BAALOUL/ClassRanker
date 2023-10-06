import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class GetStudentRankViewData {
  Crud crud;
  GetStudentRankViewData(this.crud);

  getstudentRankData(String studentId) async {
    var response = await crud.postData(Links.getRank, {"studentId": studentId});
    return response.fold((l) => l, (r) => r);
  }
}
