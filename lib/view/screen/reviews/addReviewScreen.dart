import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/auth/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/reviews/addReviewController.dart';
import '../../../core/constant/consColors.dart';
import '../../widgets/sections/firstRowBackArrow.dart';
import '../../widgets/titleCustomBig.dart';

class AddReviewScreen extends StatelessWidget {
  final AddReviewController reviewController = Get.put(AddReviewController());

  AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const FirstRowBackArrow(),
          backgroundColor: ConsColors.blueWhite,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: ConsColors.blueWhite,
                height: 150,
                child: const TitleCustomBig(
                  title: "Add your review",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: RatingDialog(
                    title: const Text(
                      'Rating Dialog',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    message: const Text(
                      'Tap a star to set your rating. Add more description here if you want.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    submitButtonText: "Submit",
                    onSubmitted: (response) {
                      reviewController.submitReview(
                          response.rating, response.comment);
                    })

                /*Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  

              
                  const SizedBox(height: 20.0),
                  // Button to submit the review
                  CustomButton(
                    text: 'Submit your review',
                    size: 14,
                    height: 45,
                    width: 220,
                    onPressed: () {
                      reviewController.submitReview();
                    },
                  ),
                ],
              ),*/
                ),
          ],
        ),
      ),
    );
  }
}
