import 'package:ecommerce_store/core/class/crud.dart';
import 'package:ecommerce_store/links.dart';
import 'package:http/http.dart' as http;

class ProviderPhotoUpdateData {
  Crud crud;
  ProviderPhotoUpdateData(this.crud);

  postProviderPhotoUpdateData(
      String provId, http.MultipartFile imageFile) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Links.providersPhotoUpdate));
    request.fields['provider_id'] = provId;
    request.files.add(imageFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      // Request successful
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      return responseString;
    } else {
      // Request failed
      return 'Failure';
    }
  }
}
