import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/providerInfosController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldCustomProvider extends GetView<ProviderInfosControllerImp> {
  final String typeT;

  const TextFieldCustomProvider({
    Key? key,
    required this.typeT,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderInfosControllerImp());
    String fieldValue = '';

    switch (typeT) {
      case "arabicName":
        fieldValue = controller.nameController.text;
        break;
      case "name":
        fieldValue = controller.nameController.text;
        break;
      case "whatsapp":
        fieldValue = controller.whatsappController.text;
        break;
      case "website":
        fieldValue = controller.websiteController.text;
        break;
    }

    return Container(
      height: 35,
      width: 220,
      padding: const EdgeInsets.only(bottom: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConsColors.blueWhite,
        border: Border.all(color: ConsColors.yellow),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: TextEditingController(text: fieldValue),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
        ),
        onChanged: (value) {
          switch (typeT) {
            case "arabicName":
              controller.nameArController.text = value;
              break;
            case "name":
              controller.nameController.text = value;
              break;
            case "whatsapp":
              controller.whatsappController.text = value;
              break;
            case "website":
              controller.websiteController.text = value;
              break;
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}



/*import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/providers/providerInformationsController.dart';

class TextFieldCustomProvider
    extends GetView<ProviderInformationControllerImp> {
  final String typeT;
  const TextFieldCustomProvider({
    super.key,
    required this.typeT,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 220,
      padding: const EdgeInsets.only(bottom: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConsColors.blueWhite,
        border: Border.all(color: ConsColors.yellow),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
        ),
        //keyboardType: TextInputType.number,
        onChanged: (value) {
          switch (typeT) {
            case "arabicName":
              controller.nameController.text = value;
              break;
            case "name":
              controller.nameController.text = value;
              break;
            case "whatsapp":
              controller.whatsappController.text = value;
              break;
            case "website":
              controller.websiteController.text = value;
              break;
          }
        },
        decoration: const InputDecoration(
          //hintText: "Type here",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          //labelText: "Your $typeT",
        ),
      ),
    );
  }
}
*/