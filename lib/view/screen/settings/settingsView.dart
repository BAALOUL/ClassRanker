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
      body: ListView(
        children: [
          _buildTile(Icons.person_add, 'Connect as Provider'.tr, () {
            //Get.toNamed(ConsRoutes.provaiderLocationUpdate, arguments: {});
            mode == ""
                ? Get.toNamed(ConsRoutes.loginScrren)
                : Get.toNamed(ConsRoutes.providerAcountWelcome);
          }),
          const Divider(),
          _buildTile(Icons.language, 'Change Language'.tr, () {
            Get.toNamed(ConsRoutes.language);
          }),
          const Divider(),
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
          }),
          const Divider(),
          _buildTile(Icons.lock, 'Privacy Policy'.tr, () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.question_answer, 'FAQs'.tr, () {
            Get.toNamed(ConsRoutes.providerImageZoneScreen, arguments: {});
          }),
          const Divider(),
          _buildTile(Icons.info, 'About Us'.tr, () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.lock_open, 'Change Password'.tr, () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.logout, 'Logout'.tr, () async {
            await logout();
            Get.offAllNamed(ConsRoutes.profileType);
          }),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, void Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
