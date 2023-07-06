import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/servicesChosingProvider.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/providers/providerServicesUpdateController.dart';
import '../../widgets/sections/firstRowBackArrow.dart';

class ProviderServicesUpdateScreen
    extends GetView<ProviderServicesUpdateControllerImp> {
  const ProviderServicesUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderServicesUpdateControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const FirstRowBackArrow(),
          backgroundColor: ConsColors.blueWhite,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: ConsColors.blueWhite,
                height: 150,
                child: const TitleCustomBig(
                  title: "Choose services",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 70),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        //const ProviderInfos(),
                        //const ProviderInfosScreen(),
                        //const SizedBox(height: 16),
                        //const ImageZoneProvider(),
                        //const SpacingBar(),
                        const ServicesChosingProvider(),
                        CustomButton(
                          text: "Save",
                          fontWeight: FontWeight.bold,
                          onPressed: () {
                            controller.saveProviderServices();

                            //Get.offAllNamed(ConsRoutes.homescreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
