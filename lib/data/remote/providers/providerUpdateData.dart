import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';

class ProviderUpdateData {
  Crud crud;
  ProviderUpdateData(this.crud);

  postProviderUpdateData(String provId, String provName, String provNameAr,
      String provWhatsapp, String provWebsite) async {
    var response = await crud.postData(Links.providerUpdate, {
      "provider_id": provId,
      "provider_name": provName,
      "provider_name_ar": provNameAr,
      "provider_whatsapp": provWhatsapp,
      "provider_website": provWebsite,
    });
    return response.fold((l) => l, (r) => r);
  }
}
