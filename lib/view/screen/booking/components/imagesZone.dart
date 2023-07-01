import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../controller/booking/bookingController.dart';

class ImagesZone extends GetView<BookingControllerImp> {
  const ImagesZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: ConsColors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: controller.selectedPhotos.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.selectedPhotos.length) {
                        final photo = controller.selectedPhotos[index];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: ConsColors.grey),
                                image: DecorationImage(
                                  image: FileImage(photo),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: ConsColors.white,
                                ),
                                onPressed: () {
                                  controller.deletePhoto(index);
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: _showImagePicker,
                          child: Image.asset(
                            'assets/screens/description/camera.png',
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePicker() {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text('Select Photo'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: const Text('Camera'),
                onTap: () {
                  _selectImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                child: const Text('Gallery'),
                onTap: () {
                  _selectImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      final photo = File(pickedFile.path);
      controller.addPhoto(photo);
      // No need to manually trigger an update since GetX's Obx widget will take care of it
    }
  }
}
