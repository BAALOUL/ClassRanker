import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ProviderStatusUpdateData {
  Crud crud;
  ProviderStatusUpdateData(this.crud);

  postProviderStatusUpdate(String providerUserId, String providerStatus) async {
    var response = await crud.postData(Links.providerStatusUpdate, {
      "providerUserId": providerUserId,
      "providerStatus": providerStatus,
    });
    return response.fold((l) => l, (r) => r);
  }
}
