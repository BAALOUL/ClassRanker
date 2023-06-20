import 'package:flutter/material.dart';

class RejectionDialog {
  static void show(BuildContext context, Function(String) onReject) {
    String selectedReason = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reason for Rejection'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // List of choices
              ListTile(
                title:
                    const Text('Provider is fully booked with other demands.'),
                onTap: () {
                  selectedReason =
                      'Provider is fully booked with other demands.';
                },
              ),
              ListTile(
                title: const Text('Provider is on vacation/holiday'),
                onTap: () {
                  selectedReason = 'Provider is on vacation/holiday';
                },
              ),
              ListTile(
                title: const Text(
                    'Provider is unable to travel to the requested location'),
                onTap: () {
                  selectedReason =
                      'Provider is unable to travel to the requested location';
                },
              ),
              ListTile(
                title: const Text(
                    'Provider is experiencing technical difficulties'),
                onTap: () {
                  selectedReason =
                      'Provider is experiencing technical difficulties';
                },
              ),
              ListTile(
                title: const Text('Provider is currently unavailable'),
                onTap: () {
                  selectedReason = 'Provider is currently unavailable';
                },
              ),
              // Text field for custom reason
              TextField(
                onChanged: (value) {
                  selectedReason = value;
                },
                decoration: const InputDecoration(labelText: 'Other reason'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (selectedReason.isNotEmpty) {
                  onReject(selectedReason);
                }
              },
              child: const Text('Reject'),
            ),
          ],
        );
      },
    );
  }
}
