import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/authController.dart';
import '../components/doctor_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'My Favorite Doctors',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: authController.getFavDoc.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    doctor: authController.getFavDoc[index],
                    isFav: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
