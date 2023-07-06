// 1- create the view for the provider details
// 2- create the controller for the provider details
// 3- determine the functions for the provider details
// we have : read details from the database from different tables such as provider and reviews
// an other function to perform the booking

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/controller/providers/providerByIDController.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/ourServices.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/ratingSection.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/reviews.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/servicesStatics.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consColors.dart';
import '../../widgets/spacingBar.dart';

class ProviderDetailsView extends GetView<ProviderByIdControllerImp> {
  //final List<Review> reviewList;

  const ProviderDetailsView({
    super.key,
  });

  //final controller =
  @override
  Widget build(BuildContext context) {
    Get.put(ProviderByIdControllerImp());

    return SafeArea(
      child: Scaffold(
        /*floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            controller.goToBooking(
                controller.serviceName, controller.serviceId);
          },
          child: const Text(
            'Book Now',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),*/
        body: GetBuilder<ProviderByIdControllerImp>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: ConsColors.blueWhite,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FirstRowBackArrow(),
                              SizedBox(
                                width: Get.size.width * 0.5,
                                child: TitleCustom(
                                  title:
                                      "${controller.providerModel.providername} ", /*- ${controller.providerModel.providernamear}*/
                                  //title: "Provider Details",
                                ),
                              ),
                              const Text(
                                "Provider",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 180),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const OurServices(),
                            CustomButton(
                              text: "Book Now",
                              onPressed: () {
                                controller.goToBooking(controller.serviceName,
                                    controller.serviceId);
                              },
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SpacingBar(),
                            const RatingSection(),
                            const SpacingBar(),
                            const ServiceStatics(),
                            const SpacingBar(),
                            const Reviews()
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: Get.size.width - 175,
                        right: 30,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: const CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/images/person.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
