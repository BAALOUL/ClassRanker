import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

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
