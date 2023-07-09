import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class SignUpOTPData {
  Crud crud;
  SignUpOTPData(this.crud);

  postOTP(String phone) async {
    var response = await crud.postData(Links.signupOTP, {
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
