import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/providers/providerByIDController.dart';
import '../../../../core/constant/consColors.dart';

class RatingSection extends GetView<ProviderByIdControllerImp> {
  //final ProviderModel providerModel;
  const RatingSection({
    super.key,
    /*required this.providerModel*/
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
            const SizedBox(width: 10),
            Text(
              controller.providerModel.providerrating.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        //const SizedBox(width: 10),
        SizedBox(
          child: Text(
            'The services completed: ${controller.providerModel.providercompleted}.',
            style: const TextStyle(
                fontSize: 14,
                color: ConsColors.blue,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
