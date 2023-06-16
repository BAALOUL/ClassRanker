import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class LoginOtpData {
  Crud crud;
  LoginOtpData(this.crud);

  postuser(String phone, String otp) async {
    var response = await crud.postData(Links.login, {
      "phone": phone,
      "otp": otp,
    });
    return response.fold((l) => l, (r) => r);
  }
}
