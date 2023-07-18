import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController myController;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  TextFieldCustom(
      {super.key, this.onChanged, this.onPressed, required this.myController});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search service'.tr,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.only(
                topRight: savedLang == 'en' ? Radius.circular(18) : Radius.zero,
                topLeft: savedLang == 'en' ? Radius.zero : Radius.circular(18),
                bottomRight:
                    savedLang == 'en' ? Radius.circular(18) : Radius.zero,
                bottomLeft:
                    savedLang == 'en' ? Radius.zero : Radius.circular(18),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
