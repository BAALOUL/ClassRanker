import 'package:ecommerce_store/controller/testDataController.dart';
import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consImageAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(ConsImageAssets.loading, width: 300, height: 300),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(child: Text("No Internet connection..."))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(child: Text("Server problem"))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                          ConsImageAssets.noData,
                          width: 300,
                          height: 300,
                        ),
                        /*
                        currentRoute == '/providerdetailview'
                            ? const Center(child: Text("No reviews"))
                            : Lottie.asset(
                                ConsImageAssets.noData,
                                width: 300,
                                height: 300,
                              ),
                        */
                      )
                    : widget;
  }
}
