import 'dart:io';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/imageHandler.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/services.dart';
import '../../../../links.dart';
import '../../widgets/auth/customButton.dart';

class ProviderImageZoneScreen extends StatelessWidget {
  final ImageHandlerImp imageController = Get.put(ImageHandlerImp());
  final MyServices myServices = Get.find();

  ProviderImageZoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String providerImg =
        myServices.sharedPreferences.get('providerImg').toString();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleCustomBig(
                title: "Choose a photo \n from your gallery",
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                      border: Border.all(
                        color: ConsColors.blueWhite,
                        width: 2.0,
                      ),
                    ),
                    child: Obx(() {
                      final File? imageFile =
                          imageController.providerImage.value;
                      if (imageFile != null && imageFile.existsSync()) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100),
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
                        onPressed: () async {
                          print("start to pick");
                          await _pickImage();
                          print("picked file");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Save ",
                size: 18,
                width: 120,
                height: 40,
                onPressed: () async {
                  await imageController.photoUpdate("new");
                  print(" go back test");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final PickedFile? image =
        await picker.getImage(source: ImageSource.gallery);
    print(" image picked : $image");
    if (image != null) {
      final File file = File(image.path);
      print(" file picked : $file");
      imageController.providerImage.value = file;
    }
  }
}
