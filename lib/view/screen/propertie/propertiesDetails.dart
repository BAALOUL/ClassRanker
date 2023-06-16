import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_store/controller/properties/propertiesDetailsController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertiesDetails extends StatelessWidget {
  const PropertiesDetails({super.key});
  static final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesDetailsControllerImp());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<PropertiesDetailsControllerImp>(
            builder: (controller) => ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                      Column(
                        children: [
                          Text(
                            "${controller.propertiesModel.operationPropertie}",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                              " ${controller.propertiesModel.typePropertie} in ${controller.propertiesModel.commune}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ConsColors.black))
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.shop_2)),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 230,
                        child: Hero(
                          tag:
                              "${controller.propertiesModel.imageDefaultPropertie}",
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Links.properties}/${controller.propertiesModel.imageDefaultPropertie}",
                            fit: BoxFit.cover,
                          ),
                        )),
                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.white60.withOpacity(0.3),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                            size: 26,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "${controller.propertiesModel.descriptionPropertie}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ConsColors.grey)),
                ),
                Row(
                  children: [
                    Text(
                      "${controller.propertiesModel.pricePropertie} QR",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                          color: Colors.green),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${controller.propertiesModel.pricePropertie} QR",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                          color: Colors.red),
                    ),
                  ],
                ),
                const Text(
                  //   latitude: ${controller.cl!.latitude}
                  "Longitude:  ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    controller.getPosition();
                  },
                  child: const Text("Get position"),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    controller.getInfos();
                  },
                  color: Colors.amber,
                  child: const Text("Get infos"),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ignore: unnecessary_null_comparison
                controller.kGooglePlex! == null
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 300,
                        width: Get.width - 40,
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      )
              ],
            ),
          )),
    );
  }
}
