import 'package:ecommerce_store/links.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ProblemDescriptionController extends GetxController {
  RxList<File> selectedPhotos = <File>[].obs;

  void addPhoto(File photo) {
    selectedPhotos.add(photo);
    update();
  }

  void deletePhoto(int index) {
    selectedPhotos.removeAt(index);
    update();
  }

  // Method to send selectedPhotos to the API
  Future<void> uploadPhotosToApi(String booking_id) async {
    String apiUrl = Links.bookingImages;

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      print("the number of photos is : ${selectedPhotos.length}");
      for (int i = 0; i < selectedPhotos.length; i++) {
        var photo = selectedPhotos[i];
        request.files.add(
            await http.MultipartFile.fromPath('booking_images', photo.path));
      }

      request.fields['booking_id'] = booking_id;

      var response = await request.send();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Photos uploaded successfully');
      } else {
        print('Failed to upload photos: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading photos: $e');
    }
  }
}
