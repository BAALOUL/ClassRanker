// ignore: file_names
import 'package:ecommerce_store/controller/profileTypeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTypeScreen extends GetView<ProfileTypeControllerImp> {
  const ProfileTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileTypeControllerImp());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Choose a profile type',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Are you looking for services or providing them?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                )),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.goToCustomerTrack();
                  },
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Customer",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.goToProviderTrack();
                  },
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.business_center,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Provider",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
