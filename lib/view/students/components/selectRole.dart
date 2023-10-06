import 'package:classRanker/controller/auth/signUpController.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dropdown_search/dropdown_search.dart';

// ignore: must_be_immutable
class SelectRole extends GetView<SinUpControllerImp> {
  const SelectRole({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SinUpControllerImp());
    return SizedBox(
      width: 160,
      height: 45,
      child: DropdownSearch<String>(
        dropdownSearchDecoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: ConsColors.yellow, width: 2.0),
          ),
          filled: true,
          fillColor: ConsColors.blueWhite,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
        mode: Mode.MENU,
        items: [
          "Admin".tr,
          "Student".tr,
        ],
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: (selectedItem) {
          controller.updateRole(selectedItem!);
          controller.update(); // Manually trigger the update
        },
        selectedItem: controller.role,
      ),
    );
  }
}
