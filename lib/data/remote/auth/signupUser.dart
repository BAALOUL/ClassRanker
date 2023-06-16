import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class SignupUser {
  Crud crud;
  SignupUser(this.crud);

  postuser(String username, String password, String email, String phone) async {
    var response = await crud.postData(Links.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
