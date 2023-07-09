import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderAccountWelcomeScreen extends StatelessWidget {
  const ProviderAccountWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Provider Account Creation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'To create your provider account, please follow these steps:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            _buildStepItem(
              stepNumber: 1,
              stepTitle: 'Fill in Personal Information',
              stepDescription: 'Provide your personal details for the account.',
            ),
            const SizedBox(height: 20),
            _buildStepItem(
              stepNumber: 2,
              stepTitle: 'Create a Photo',
              stepDescription: 'Upload a photo for your provider profile.',
            ),
            const SizedBox(height: 20),
            _buildStepItem(
              stepNumber: 3,
              stepTitle: 'Choose Services',
              stepDescription:
                  'Select the services you will offer as a provider.',
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Get Started',
              width: 180,
              fontWeight: FontWeight.bold,
              onPressed: () {
                Get.toNamed(ConsRoutes.providerInfosCreateScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem({
    required int stepNumber,
    required String stepTitle,
    required String stepDescription,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: ConsColors.blue,
          child: Text(
            stepNumber.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stepTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stepDescription,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
