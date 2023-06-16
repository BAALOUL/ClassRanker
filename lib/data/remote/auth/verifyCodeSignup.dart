import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  checkVerifyCode(String email, String verifycode) async {
    var response = await crud.postData(Links.verifycodeSignUp, {
      "email": email,
      "code": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
