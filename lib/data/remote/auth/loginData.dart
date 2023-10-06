import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postuser(String email, String password) async {
    var response = await crud.postData(Links.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
