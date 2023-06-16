import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/auth/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reviews/addReviewController.dart';

class AddReviewScreen extends StatelessWidget {
  final AddReviewController reviewController = Get.put(AddReviewController());

  AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Review'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Write a Review',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20.0),
              // Display the rating stars
              GetBuilder<AddReviewController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final isFilled = controller.rating.value > index;
                      final icon = isFilled ? Icons.star : Icons.star_border;
                      final color = isFilled ? Colors.yellow : null;

                      return IconButton(
                        icon: Icon(
                          icon,
                          color: color,
                          size: 50,
                        ),
                        onPressed: () {
                          controller.setRating(index + 1);
                        },
                      );
                    }),
                  );
                },
              ),

              const SizedBox(height: 40.0),

              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  onChanged: (value) {
                    reviewController.setComment(value);
                  },
                  maxLines: null, // Allow multiple lines
                  minLines: 3, // Set the minimum lines to 5
                  decoration: InputDecoration(
                    //hintText: "Comment",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30), // Adjust the vertical padding
                    labelText:
                        "Take your comment", // Use labelText instead of label
                    suffixIcon: const Icon(Icons.comment),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Button to submit the review
              CustomButton(
                text: 'Submit your review',
                onPressed: () {
                  reviewController.submitReview();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
