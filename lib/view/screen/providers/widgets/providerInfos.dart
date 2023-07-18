import 'package:ecommerce_store/view/screen/providers/controllers/providerInfosController.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/textFieldCustomProvider.dart';
import 'package:ecommerce_store/view/widgets/firstRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/consColors.dart';
import '../../../widgets/sections/firstRowBackArrow.dart';
import '../../../widgets/titleCustomBig.dart';

class ProviderInfos extends GetView<ProviderInfosControllerImp> {
  const ProviderInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FirstRowBackArrow(),
        backgroundColor: ConsColors.blueWhite,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleCustomBig(
            title: "Choose Services",
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleCustomBig(
                title: "Arabic Name",
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              TextFieldCustomProvider(typeT: "arabicName"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleCustomBig(
                title: "Name",
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              TextFieldCustomProvider(typeT: "name"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleCustomBig(
                title: "Whatsapp",
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              TextFieldCustomProvider(typeT: "whatsapp"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleCustomBig(
                title: "Website",
                size: 15,
              ),
              SizedBox(
                width: 8,
              ),
              TextFieldCustomProvider(typeT: "website"),
            ],
          ),
        ],
      ),
    );
  }
}
