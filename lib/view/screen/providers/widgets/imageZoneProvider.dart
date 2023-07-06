import 'dart:io';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/imageHandler.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/services.dart';
import '../../../../links.dart';

class ImageZoneProvider extends GetView<ImageHandlerImp> {
  const ImageZoneProvider({super.key});

  @override
  Widget build(BuildContext context) {
    ImageHandlerImp imageController = Get.put(ImageHandlerImp());

    MyServices myServices = Get.find();
    String providerImg =
        myServices.sharedPreferences.get('providerImg').toString();
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              border: Border.all(
                color: ConsColors.blueWhite,
                width: 2.0,
              ),
            ),
            child: Obx(() {
              final File? imageFile = imageController.providerImage.value;
              if (imageFile != null && imageFile.existsSync()) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    imageFile,
                    fit: BoxFit.fill,
                  ),
                );
              } else if (providerImg.isNotEmpty) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    '${Links.providers}/$providerImg',
                    fit: BoxFit.fill,
                  ),
                );
              } else {
                return Container(); // Empty container as a fallback
              }
            }),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 38,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ConsColors.yellow,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: ConsColors.blue,
                ),
                onPressed: () {
                  _pickImage(imageController);
                },
              ),
            ),
          ),
        ],
      ),
    ]);

    /*Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            _pickImage(controller);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Obx(() {
              final File? imageFile = controller.providerImage.value;
              if (imageFile != null && imageFile.existsSync()) {
                return Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                );
              } else {
                return Icon(
                  Icons.photo,
                  size: 50,
                  color: Colors.grey[400],
                );
              }
            }),
          ),
        ),
        CustomButton(
          text: "Select photo",
          size: 14,
          height: 40,
          iconAssetPath: 'assets/screens/sections/addImage.png',
          onPressed: () {
            _pickImage(controller);
          },
        ),
        const SizedBox(width: 16),
      ],
    );*/
  }

  void _pickImage(ImageHandlerImp imageController) async {
    final ImagePicker picker = ImagePicker();
    final PickedFile? image =
        await picker.getImage(source: ImageSource.gallery);

    if (image != null) {
      final File file = File(image.path);
      imageController.providerImage.value = file;
    }
  }
}
