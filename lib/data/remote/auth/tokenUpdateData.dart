import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class TokenUpdateData {
  Crud crud;
  TokenUpdateData(this.crud);

  postTokenUpdate(String userId, String token) async {
    var response = await crud.postData(Links.tokenUpdate, {
      "userId": userId,
      "token": token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
