import 'package:ecommerce_store/bindings/initialBinding.dart';
import 'package:ecommerce_store/core/localization/localization.dart';
import 'package:ecommerce_store/core/localization/localizationController.dart';
import 'package:ecommerce_store/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/consColors.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalizationController controller = Get.put(LocalizationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocalization(),
      title: 'Flutter Demo'.tr,
      locale: controller.language,
      theme: theme(),
      /*theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: ConsColors.black),
            headline2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: ConsColors.black),
            bodyText1: TextStyle(fontSize: 15, color: ConsColors.grey)),
        primarySwatch: Colors.blue,
      )*/
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
