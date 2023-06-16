import 'package:ecommerce_store/controller/homeController/homeController.dart';
import 'package:ecommerce_store/links.dart';
import 'package:ecommerce_store/view/widgets/home/price_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowItems extends GetView<HomeControllerImp> {
  const ShowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.properties.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                SizedBox(
                    height: 110,
                    width: 150,
                    child: Image.network(
                      "${Links.properties}/${controller.properties[index]['image_default_propertie']}",
                      fit: BoxFit.fill,
                    )),
                Container(
                  height: 110,
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                ),
                PriceCustom(
                    price:
                        "${controller.properties[index]['price_propertie']}"),
              ],
            );
          }),
    );
  }
}
