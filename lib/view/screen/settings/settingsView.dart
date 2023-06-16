import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consRoutes.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _buildTile(Icons.star, 'Rate Us povider Add', () {
            Get.toNamed(ConsRoutes.providerAdd, arguments: {});
          }),
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
            // Handle tile tap
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
            // Handle tile tap
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
