import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class VerifyOtpSignUpData {
  Crud crud;
  VerifyOtpSignUpData(this.crud);

  checkVerifyOTP(String phone, String otp) async {
    var response = await crud.postData(Links.verifyOTP, {
      "phone": phone,
      "code": otp,
    });
    return response.fold((l) => l, (r) => r);
  }
}
