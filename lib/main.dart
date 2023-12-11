import 'package:classRanker/bindings/initialBinding.dart';
import 'package:classRanker/controller/localController.dart';
import 'package:classRanker/core/localization/localization.dart';
import 'package:classRanker/core/localization/localizationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config.dart';
import 'core/constant/consColors.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Initialize Config within the context of MaterialApp
    Config.init(context);

    LocalizationController controller = Get.put(LocalizationController());
    LocalController localController = Get.put(LocalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocalization(),
      title: 'Flutter Demo'.tr,
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "Poppins",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ConsColors.black,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ConsColors.black,
          ),
          bodyText1: TextStyle(fontSize: 15, color: ConsColors.grey),
        ),
        primarySwatch: Colors.yellow, // Set the primary color to yellow here
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
