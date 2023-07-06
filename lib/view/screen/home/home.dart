import 'package:ecommerce_store/controller/homeController/homeController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/core/shared/appBarCustom.dart';
import 'package:ecommerce_store/view/screen/home/offerZoneCustom.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: const [
                  AppBarCustom(),
                  OfferZoneCustom(),
                  TitleCustom(
                    title: "Categories",
                  ),

                  /*
                  ShowCategories(),
                  TitleCustom(
                    title: "New appartments",
                  ),
                  ShowItems(),
                  TitleCustom(
                    title: "New Villa",
                  ),
                  ShowItems(),
                  TitleCustom(
                    title: "We rent",
                  ),
                  ShowItems(),
                  TitleCustom(
                    title: "We sale",
                  ),
                  ShowItems(),*/
                ],
              ),
            )));
  }
}
