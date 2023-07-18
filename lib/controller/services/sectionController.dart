import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/remote/services/searchServicesData.dart';
import 'package:ecommerce_store/data/remote/services/sectionsViewData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/serviceSectionModel.dart';

abstract class SectionsController extends GetxController {
  getData();
  goToCategories(String sectionId);
  goToServices(String sectID, String sectionName, String sectionNameAr);
}

class SectionsControllerImp extends SectionsController {
  SectionsViewData sectionsView = SectionsViewData(Get.find());
  SearchServicesData searchServicesData = SearchServicesData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List sectionsList = [];
  List<ServiceSectionModel> listServices = [];
  late String username;
  late String? mode;
  TextEditingController? search;
  bool isSearching = false;

  checkSearch(val) {
    if (val == "") {
      isSearching = false;
    }
    update();
  }

  onSearchServices() {
    isSearching = true;
    searchServices();
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await sectionsView.getSectionsListData();
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("response: $response");
        sectionsList.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchServices() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await searchServicesData.getServicesData(search!.text);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        print("response data: ${search!.text}");
        listServices.clear();
        listServices
            .addAll(responseData.map((e) => ServiceSectionModel.fromJson(e)));
        print(" image path ${listServices[0].serviceimage}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  goToCategories(sectionId) {
    Get.toNamed(ConsRoutes.categoryView, arguments: {
      "sectionId": sectionId,
    });
  }

  initData() {
    search = TextEditingController();
    mode = myServices.sharedPreferences.get('mode').toString();
    mode == ""
        ? username = "Guest"
        : username = myServices.sharedPreferences.get("username").toString();
    getData();
  }

  @override
  goToServices(sectID, sectionName, sectionNameAr) {
    Get.toNamed(ConsRoutes.servicesView, arguments: {
      "sectionId": sectID,
      "sectionName": sectionName,
      "sectionNameAr": sectionNameAr
    });
  }

  geToProviders(servID, serviceName, serviceNameAr) {
    Get.toNamed(ConsRoutes.providersView, arguments: {
      "serviceID": servID,
      "serviceName": serviceName,
      "serviceNameAr": serviceNameAr
    });
  }
}
