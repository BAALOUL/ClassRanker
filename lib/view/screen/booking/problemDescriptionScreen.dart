import 'dart:io';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/booking/components/imagesZone.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/booking/bookingController.dart';
import '../../widgets/auth/customButton.dart';
import 'bookingButton.dart';

class ProblemDescriptionScreen extends GetView<BookingControllerImp> {
  const ProblemDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookingControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: ConsColors.blueWhite,
          body: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FirstRowBackArrow(),
              const ImagesZone(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(color: ConsColors.grey),
                  ),
                  child: SizedBox(
                    height: 150.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Problem Description',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          controller.description = value;
                        },
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        style: const TextStyle(height: 1.5),
                      ),
                    ),
                  ),
                ),
              ),

              // Other widgets can be added here
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  text: "Continue",
                  onPressed: () {
                    controller.goToBookinSummary();
                  },
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
    );
  }
}



      /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                    child: CustomButton(
                      text: "Add photos",
                      onPressed: () {
                        _showImagePicker();
                      },
                      iconAssetPath:
                          'assets/screens/description/mode-landscape.png',
                    ),
                  ),
                ],
              ),*/