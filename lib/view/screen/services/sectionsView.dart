import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/screen/services/showSections.dart';
import 'package:ecommerce_store/view/widgets/textFieldCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/services/sectionController.dart';
import '../../../core/constant/consColors.dart';
import '../../../core/services/services.dart';
import '../../../data/model/serviceSectionModel.dart';
import '../../../links.dart';
import '../../widgets/sections/getStartStack.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SectionsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SectionsControllerImp>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView(
                    children: [
                      //const FirstRow(),
                      const GetStartStack(),
                      //************************** search service********************** */
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFieldCustom(
                            onPressed: controller
                                .onSearchServices, // Remove the parentheses to pass the reference
                            onChanged: controller
                                .checkSearch, // Remove the parentheses to pass the reference
                            myController: controller.search!,
                          )),
                      //********************end search service *********************************** */
                      const SizedBox(
                        height: 5,
                      ),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: !controller.isSearching
                              ? Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        "or select from sections".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: ConsColors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50),
                                        child: const ShowSections()),
                                  ],
                                )
                              : ListServicesWidget(
                                  listServices: controller.listServices,
                                ))
                    ],
                  ),
                )),
      ),
    );
  }
}

class ListServicesWidget extends StatelessWidget {
  final List<ServiceSectionModel> listServices;
  const ListServicesWidget({super.key, required this.listServices});

  @override
  Widget build(BuildContext context) {
    SectionsControllerImp controller = Get.put(SectionsControllerImp());
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listServices.length,
      itemBuilder: (Context, index) {
        return InkWell(
          onTap: () {
            controller.geToProviders(
              controller.listServices[index].serviceid,
              controller.listServices[index].sectionname,
              controller.listServices[index].sectionnamear,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: ConsColors.blueWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Links.services}/${listServices[index].serviceimage}",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          savedLang == "en"
                              ? listServices[index].servicename!
                              : listServices[index].servicenamear!,
                          style: TextStyle(
                              fontSize: savedLang == "en" ? 14 : 18,
                              color: ConsColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            savedLang == "en"
                                ? listServices[index].sectionname!
                                : listServices[index].sectionnamear!,
                            style: TextStyle(
                              fontSize: savedLang == "en" ? 13 : 15,
                              color: ConsColors.grey,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
