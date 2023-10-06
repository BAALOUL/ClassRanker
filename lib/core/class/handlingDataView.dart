import 'package:classRanker/controller/testDataController.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consImageAssets.dart';
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
