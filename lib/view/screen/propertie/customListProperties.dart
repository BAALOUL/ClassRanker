import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_store/controller/properties/propertiesController.dart';
import 'package:ecommerce_store/data/model/propertiesModels.dart';
import 'package:ecommerce_store/links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListProperties extends GetView<PropertiesControllerImp> {
  final PropertiesModel propertiesModel;
  const CustomListProperties({super.key, required this.propertiesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToDetails(propertiesModel);
      },
      child: Card(
        child: Container(
          height: 50,
          //color: Colors.amber,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(3),
                child: Hero(
                  tag: "${propertiesModel.imageDefaultPropertie}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Links.properties}/${propertiesModel.imageDefaultPropertie}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(
                  " ${propertiesModel.typePropertie} in ${propertiesModel.commune}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 3, right: 4),
                    child: Text(
                      "Rating ",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => index > 2
                              ? const Icon(
                                  Icons.star_outline,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.yellow,
                                ))
                    ],
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "${propertiesModel.pricePropertie} QR",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans",
                          color: Colors.red),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 20,
                      ))
                ],
              ),
              //const Text("data")
            ],
          ),
        ),
      ),
    );
  }
}
