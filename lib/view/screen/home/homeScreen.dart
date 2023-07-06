import 'package:ecommerce_store/controller/homeController/homescreenController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/view/screen/home/buttonForBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/sections/firstRow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const FirstRow(),
        backgroundColor: ConsColors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: ConsColors.yellow,
                onPressed: () {
                  Get.toNamed(ConsRoutes.addReview);
                },
                child: const Icon(Icons.shopping_basket_sharp),
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
