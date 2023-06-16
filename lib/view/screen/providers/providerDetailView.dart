// 1- create the view for the provider details
// 2- create the controller for the provider details
// 3- determine the functions for the provider details
// we have : read details from the database from different tables such as provider and reviews
// an other function to perform the booking

// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/controller/providers/providerByIDController.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/ourServices.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/providerContacts.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/ratingSection.dart';
import 'package:ecommerce_store/view/screen/providers/widgets/servicesStatics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          controller.goToBooking(controller.serviceName, controller.serviceId);
        },
        child: const Text(
          'Book Now',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<ProviderByIdControllerImp>(
          builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    TitleCustom(
                      title:
                          "${controller.providerModel.providername} - ${controller.providerModel.providernamear}",
                      //title: "Provider Details",
                    ),
                    // section of the service resume and the photo.
                    const OurServices(),
                    // spacing
                    const SpacingBar(),
                    const RatingSection(),
                    const SpacingBar(),

                    // the third section
                    const ProviderContacts(),
                    const SpacingBar(),

                    const ServiceStatics(),

                    const SpacingBar(),

                    // reviews and comments
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.reviewsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/m3.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.yellow, size: 16),
                                        const SizedBox(width: 5),
                                        Text(
                                          controller.reviewsList[index]
                                                  ['review_rating']
                                              .toString(),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      controller.reviewsList[index]
                                              ['review_comment']
                                          .toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      controller.reviewsList[index]
                                              ['review_date']
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )),
    );
  }
}
