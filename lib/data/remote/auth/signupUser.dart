import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class SignupUser {
  Crud crud;
  SignupUser(this.crud);

  postuser(String username, String email, String password) async {
    var response = await crud.postData(Links.signup, {
      "name": username,
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
