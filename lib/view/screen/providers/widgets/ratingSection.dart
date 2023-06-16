import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/providers/providerByIDController.dart';

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
        const SizedBox(
          child: Text(
            'The services completed are 109.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
