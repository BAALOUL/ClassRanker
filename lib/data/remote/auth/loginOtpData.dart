import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

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
