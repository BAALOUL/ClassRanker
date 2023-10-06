import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class SignupUser {
  Crud crud;
  SignupUser(this.crud);

  postuser(String username, String fullname, String password, String email,
      String phone, String role) async {
    var response = await crud.postData(Links.signup, {
      "username": username,
      "fullname": fullname,
      "password": password,
      "email": email,
      "phone": phone,
      "role": role,
    });
    return response.fold((l) => l, (r) => r);
  }
}
