// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/providerContactsController.dart';
import 'package:ecommerce_store/view/widgets/firstRow.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/titleCustomBig.dart';

class ProviderContactView extends StatelessWidget {
  //final List<Review> reviewList;
  const ProviderContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProviderContactsControllerImp controller =
        Get.put(ProviderContactsControllerImp());
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
                child: TitleCustomBig(
                  title: "Provider Contacts".tr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: GetBuilder<ProviderContactsControllerImp>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        const SizedBox(height: 10),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          title: Text('Phone'.tr),
                          subtitle: Text(controller.providerModel?.phone ?? ""),
                          onTap: () {
                            // Handle phone contact tap
                            // Example: launch phone dialer with the number
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.whatsapp),
                          title: Text('Whatsapp'.tr),
                          subtitle: Text(
                              controller.providerModel?.providerwhatsapp ?? ""),
                          onTap: () {
                            // launch('https://www.example.com'); // Open website URL
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text('Address'.tr),
                          subtitle: const Text('123 Main St, City, Country'),
                          onTap: () {
                            // Handle address contact tap
                            // Example: open maps with the address location
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.email),
                          title: Text('Email'.tr),
                          subtitle: Text(controller.providerModel?.email ?? ""),
                          onTap: () {
                            // Handle email contact tap
                            // Example: launch email client with the email address
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons
                              .language), // Replace with your WhatsApp icon
                          title: Text('Website'.tr),
                          subtitle: Text(
                              controller.providerModel?.providerwebsite ?? ""),
                          onTap: () {
                            //launch('https://wa.me/1234567890'); // Open WhatsApp chat
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
/*

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/providerContactsController.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusRequest.dart';
import '../../widgets/titleCustomBig.dart';
import '../booking/components/radiusSimpleText.dart';

class ProviderContactView extends GetView<ProviderContactsControllerImp> {
  const ProviderContactView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderContactsControllerImp());
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
                  title: "Provider Contacts",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 60),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Obx(() {
                if (controller.statusRequest == StatusRequest.loading) {
                  return const CircularProgressIndicator();
                } else if (controller.statusRequest == StatusRequest.success) {
                  return ListView(
                    children: [
                      const SizedBox(height: 10),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('Phone'),
                        subtitle: Text(controller.providerModel.phone ?? ""),
                        onTap: () {
                          // Handle phone contact tap
                          // Example: launch phone dialer with the number
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('Email'),
                        subtitle: Text(controller.providerModel.email ?? ""),
                        onTap: () {
                          // Handle email contact tap
                          // Example: launch email client with the email address
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on),
                        title: const Text('Whatsapp'),
                        subtitle: Text(
                            controller.providerModel.providerwhatsapp ?? ""),
                        onTap: () {
                          // Handle address contact tap
                          // Example: open maps with the address location
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Website'),
                        subtitle: Text(
                            controller.providerModel.providerwebsite ?? ""),
                        onTap: () {
                          // launch('https://www.example.com'); // Open website URL
                        },
                      ),
                    ],
                  );
                } else {
                  return const Text('Failed to load provider contacts');
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
*/