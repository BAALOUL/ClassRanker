import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RejectionDialog {
  static void show(BuildContext context, Function(String) onReject) {
    String selectedReason = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reason for Rejection'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // List of choices
              ListTile(
                title: Text('Provider is fully booked with other demands.'.tr),
                onTap: () {
                  selectedReason =
                      'Provider is fully booked with other demands.'.tr;
                },
              ),
              ListTile(
                title: Text('Provider is on vacation/holiday'.tr),
                onTap: () {
                  selectedReason = 'Provider is on vacation/holiday'.tr;
                },
              ),
              ListTile(
                title: Text(
                    'Provider is unable to travel to the requested location'
                        .tr),
                onTap: () {
                  selectedReason =
                      'Provider is unable to travel to the requested location'
                          .tr;
                },
              ),
              ListTile(
                title:
                    Text('Provider is experiencing technical difficulties'.tr),
                onTap: () {
                  selectedReason =
                      'Provider is experiencing technical difficulties'.tr;
                },
              ),
              ListTile(
                title: Text('Provider is currently unavailable'.tr),
                onTap: () {
                  selectedReason = 'Provider is currently unavailable'.tr;
                },
              ),
              // Text field for custom reason
              TextField(
                onChanged: (value) {
                  selectedReason = value;
                },
                decoration: InputDecoration(labelText: 'Other reason'.tr),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                if (selectedReason.isNotEmpty) {
                  onReject(selectedReason);
                }
              },
              child: Text('Reject'.tr),
            ),
          ],
        );
      },
    );
  }
}
