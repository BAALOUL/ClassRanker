import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/constant/consRoutes.dart';
import '../../../core/services/services.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildTile(Icons.person_add, 'Connect as Provider', () {
            Get.toNamed(ConsRoutes.provaiderLocationUpdate, arguments: {});
          }),
          const Divider(),
          _buildTile(Icons.language, 'Change Language', () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.credit_card, 'Add Payment Card', () {
            Get.toNamed(ConsRoutes.addPaymentCard, arguments: {});
          }),
          const Divider(),
          _buildTile(Icons.mail, 'Contact Us', () {
            Get.toNamed(ConsRoutes.contactUsScreen, arguments: {});
          }),
          const Divider(),
          _buildTile(Icons.share, 'Share Al3amel', () {
            Get.toNamed(ConsRoutes.problemDescriptionScreen, arguments: {});
          }),
          const Divider(),
          _buildTile(Icons.star, 'Rate Us', () {}),
          const Divider(),
          _buildTile(Icons.description, 'Terms of Service', () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.lock, 'Privacy Policy', () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.question_answer, 'FAQs', () {
            Get.toNamed(ConsRoutes.providerImageZoneScreen, arguments: {});
          }),
          const Divider(),
          _buildTile(Icons.info, 'About Us', () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.lock_open, 'Change Password', () {
            // Handle tile tap
          }),
          const Divider(),
          _buildTile(Icons.logout, 'Logout', () {
            myServices.sharedPreferences.setString("providerImg", "");
            myServices.sharedPreferences.setString("providerId", "");
            SystemNavigator.pop();
            //Get.offAllNamed(ConsRoutes.loginScrren);
            //Get.toNamed(ConsRoutes.loginScrren);
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
