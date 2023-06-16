import 'package:ecommerce_store/controller/services/categoryController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../links.dart';

class ShowCategory extends GetView<CategoryControllerImp> {
  const ShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridView.builder(
        itemCount: controller.categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller
                  .goToServices(controller.categoryList[index]["category_id"]);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "${Links.services}/${controller.categoryList[index]['category_image']}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        textAlign: TextAlign.center,
                        "${controller.categoryList[index]['category_name']}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




/*
      ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.goToServices(
                    controller.categoryList[index]["category_id"]);
              },
              child: Column(
                children: [
                  Container(
                      width: 80,
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          "${Links.category}/${controller.categoryList[index]['category_image']}")),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${controller.categoryList[index]['category_name']}",
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          })

          */