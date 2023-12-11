import 'package:classRanker/controller/auth/authController.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DoctorDetailsController extends GetxController {}

class DoctorDetailsControllerImp extends DoctorDetailsController {
  AuthController authController = Get.put(AuthController());
  late Map<String, dynamic> doctor = {};
  late bool isFav = false;

  @override
  void onInit() {
    super.onInit();

    // Receive the arguments using Get.arguments
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      doctor = arguments['doctor'] ?? {};
      isFav = arguments['isFav'] ?? false;
    }
  }

  void toggleFavorite() async {
    final list = authController.getFav;

    if (list.contains(doctor['doc_id'])) {
      list.removeWhere((id) => id == doctor['doc_id']);
    } else {
      list.add(doctor['doc_id']);
    }

    authController.setFavList(list);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty && token != '') {
      // Update the favorite list into the database.
      /* final response = await DioProvider().storeFavDoc(token, list);
       if (response == 200) {
         isFav.toggle();
       }*/
    }
  }
}
