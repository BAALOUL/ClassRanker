import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/core/functions/logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consRoutes.dart';
import '../../../core/services/services.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String mode = myServices.sharedPreferences.get('mode').toString();
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Settings'.tr,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ConsColors.blue),
                ),
                const SizedBox(height: 8),
              ],
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
          child: ListView(
            children: [
              /* _buildTile(Icons.person_add, 'Connect as Provider'.tr, () {
              //Get.toNamed(ConsRoutes.provaiderLocationUpdate, arguments: {});
              mode == ""
                  ? Get.toNamed(ConsRoutes.loginScrren)
                  : Get.toNamed(ConsRoutes.providerAcountWelcome);
            }),
            const Divider(),*/
              _buildTile(
                  Image.asset(
                    'assets/screens/settings/language.png',
                    width: 32,
                    height: 32,
                  ),
                  'Change Language'.tr, () {
                Get.toNamed(ConsRoutes.language);
              }),
              /* const Divider(),
            _buildTile(Icons.credit_card, 'Add Payment Card'.tr, () {
              Get.toNamed(ConsRoutes.addPaymentCard, arguments: {});
            }),
            const Divider(),
            _buildTile(Icons.mail, 'Contact Us'.tr, () {
              Get.toNamed(ConsRoutes.contactUsScreen, arguments: {});
            }),
            const Divider(),
            _buildTile(Icons.share, 'Share Al3amel'.tr, () {
              Get.toNamed(ConsRoutes.problemDescriptionScreen, arguments: {});
            }),
            const Divider(),
            _buildTile(Icons.star, 'Rate Us'.tr, () {}),
            const Divider(),
            _buildTile(Icons.description, 'Terms of Service'.tr, () {
              // Handle tile tap
            }),*/
              const Divider(),
              _buildTile(
                  Image.asset(
                    'assets/screens/settings/insurance.png',
                    width: 32,
                    height: 32,
                  ),
                  'Privacy Policy'.tr, () {
                // Handle tile tap
              }),
              /* const Divider(),
            _buildTile(
                Image.asset('assets/screens/sections/bells.png'), 'FAQs'.tr, () {
              Get.toNamed(ConsRoutes.providerImageZoneScreen, arguments: {});
            }),*/
              const Divider(),
              _buildTile(
                  Image.asset(
                    'assets/screens/settings/i.png',
                    width: 32,
                    height: 32,
                  ),
                  'About Us'.tr, () {
                // Handle tile tap
              }),
              const Divider(),
              _buildTile(
                  Image.asset(
                    'assets/screens/settings/logout.png',
                    width: 32,
                    height: 32,
                  ),
                  'OCR'.tr, () {
                Get.offAllNamed(ConsRoutes.ocrView);
              }),
              const Divider(),
              _buildTile(
                  Image.asset(
                    'assets/screens/settings/logout.png',
                    width: 32,
                    height: 32,
                  ),
                  'Logout'.tr, () async {
                await logout();
                Get.offAllNamed(ConsRoutes.profileType);
              }),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildTile(Image icon, String title, void Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
            color: ConsColors.blue, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
