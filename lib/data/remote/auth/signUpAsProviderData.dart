import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class SignUpAsProviderData {
  Crud crud;
  SignUpAsProviderData(this.crud);

  postProvider(String phone, String otp) async {
    var response = await crud.postData(Links.signup, {
      "phone": phone,
      "code": otp,
    });
    return response.fold((l) => l, (r) => r);
  }
}
