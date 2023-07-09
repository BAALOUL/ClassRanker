import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ProviderCreateData {
  Crud crud;
  ProviderCreateData(this.crud);

  postProviderCreateData(String userId, String provName, String provNameAr,
      String provWhatsapp, String provWebsite) async {
    var response = await crud.postData(Links.providerCreate, {
      "provider_user_id": userId,
      "provider_name": provName,
      "provider_name_ar": provNameAr,
      "provider_whatsapp": provWhatsapp,
      "provider_website": provWebsite,
    });
    return response.fold((l) => l, (r) => r);
  }
}
