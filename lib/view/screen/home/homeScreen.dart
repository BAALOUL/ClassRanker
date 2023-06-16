import 'package:ecommerce_store/controller/homeController/homescreenController.dart';
import 'package:ecommerce_store/view/screen/home/buttonForBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 245, 126, 7),
              onPressed: () {
                print(controller.myToken);
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
                                ? Colors.amber
                                : Colors.black,
                          );
                  }))
                ],
              ),
            ),
            body: controller.listPages.elementAt(controller.currentPage)));
  }
}
