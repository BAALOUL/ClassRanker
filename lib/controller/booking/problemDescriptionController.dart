import 'package:get/get.dart';
import 'dart:io';

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
}
