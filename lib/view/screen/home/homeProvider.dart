import 'package:ecommerce_store/controller/homeController/homeProviderController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/home/buttonForBottomBar.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/providerInfosController.dart';
import 'package:ecommerce_store/view/screen/providers/providerInfosScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/firstRow.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeProviderControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const FirstRow(),
        backgroundColor: ConsColors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<HomeProviderControllerImp>(
          builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: ConsColors.blueWhite,
                onPressed: () {
                  Get.to(() => const ProviderInfosScreen(),
                      binding: BindingsBuilder(() {
                    Get.put(ProviderInfosControllerImp());
                  }));
                },
                child: Image.asset(
                  'assets/screens/sections/switch.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.contain,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: Row(
                  children: [
                    ...List.generate(controller.listPages.length + 1, ((index) {
                      int i = index < 2 ? index : index - 1;

                      return index == 2
                          ? const Spacer()
                          : ButtonForBottomBar(
                              title: controller.buttonBottomAppBar[i],
                              icon: controller.listIconBottomAppBar[i],
                              onpressed: () {
                                controller.changePage(i);
                              },
                              color: controller.currentPage == i
                                  ? ConsColors.yellow
                                  : ConsColors.blue,
                            );
                    }))
                  ],
                ),
              ),
              body: controller.listPages.elementAt(controller.currentPage))),
    );
  }
}
