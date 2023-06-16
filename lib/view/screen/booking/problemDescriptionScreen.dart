import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/booking/bookingController.dart';
import 'bookingButton.dart';

class ProblemDescriptionScreen extends GetView<BookingControllerImp> {
  const ProblemDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookingControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GetBuilder<BookingControllerImp>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(5.0), // Border color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Set the number of columns here
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: controller.selectedPhotos.length,
                          itemBuilder: (context, index) {
                            final photo = controller.selectedPhotos[index];
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(photo),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      controller.deletePhoto(index);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed:
                        _showImagePicker, // Update the onPressed callback
                    child: const Text('Add Photo'),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150.0,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Problem Description',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 97, 97, 96)),
                    ),
                  ),
                  onChanged: (value) {
                    controller.description = value;
                    print(controller.description);
                  },
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  style: const TextStyle(height: 1.5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                BookingButton(
                    text: "Continue",
                    onPressed: () {
                      controller.goToBookinSummary();
                    }),
                const SizedBox(
                  width: 1,
                ),
              ],
            ),
          ],
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
      controller.update(); // Manually trigger an update
    }
  }
}
