import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderAnswer extends StatelessWidget {
  const ProviderAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderAnswerController());
    return GetBuilder<ProviderAnswerController>(
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.answer,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:
                        controller.accepted == true ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  controller.answerDetail,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: controller.buttonText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProviderAnswerController extends GetxController {
  late String answer;
  late String answerDetail;
  late String buttonText;
  late bool accepted;

  late String bookingId = "";
  late String bookingProviderId = "";
  late String serviceName = "";
  late String username = "";
  late String bookingDate = "";
  late String bookingAddress = "";
  late String demandStatus = "";

  @override
  void onInit() {
    init();
  }

  void init() {
    var arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      bookingId = arguments['booking_id'];
      bookingProviderId = arguments['booking_provider_id'];
      serviceName = arguments['service_name'];
      username = arguments['username'];
      bookingDate = arguments['booking_date'];
      bookingAddress = arguments['booking_address'];
      demandStatus = arguments['booking_status'];
      //print("Id : $bookingId  date : $bookingDate , status : $demandStatus");
      switch (demandStatus) {
        case 'pending':
          answer = 'Pending';
          answerDetail = 'Pending';
          buttonText = 'Pending';
          break;
        case 'current':
          answer = 'current';
          answerDetail = 'Your demand has been accepted';
          buttonText = 'Click to contact the provider';
          break;
        case 'rejected':
          answer = 'Rejected';
          answerDetail = 'Your demand has been $answer';
          buttonText = 'Choose an other provider';
          break;
        case 'canceled':
          answer = 'Canceled';
          answerDetail = 'Your demand has been $answer';
          buttonText = 'Choose an other provider';
          break;
        case 'completed':
          answer = 'Completed';
          answerDetail = 'Your demand has been $answer';
          buttonText = 'you could leave your review';
          break;
        default:
          break;
        // Handle other cases here
        // Do something else
      }
    }
    if (demandStatus == 'current') {
      accepted = true;
    } else {
      accepted = false;
    }
  }
}
