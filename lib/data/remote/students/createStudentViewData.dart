import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class CreateStudentData {
  Crud crud;
  CreateStudentData(this.crud);

  postCreateStudentData(
      String username,
      String password,
      String fullName,
      String className,
      String rank,
      String grade,
      String attendance,
      String email,
      String phone) async {
    var response = await crud.postData(Links.createStudent, {
      "username": username,
      "password": password,
      "fullname": fullName,
      "class_name": className,
      "rank": rank,
      "grade": grade,
      "attendance": attendance,
      "email": email,
      "phone": phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
