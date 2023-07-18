import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingCompleted extends StatelessWidget {
  const BookingCompleted({
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
                  controller.accepted
                      ? 'The provider have accepted your demand'.tr
                      : "The provider dosen't accept your demand".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: controller.accepted
                      ? 'You can Contact him'
                      : 'Choose Another Provider',
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
      print("Id : $bookingId  date : $bookingDate , status : $demandStatus");
    }
    if (demandStatus == 'current') {
      accepted = true;
    } else {
      accepted = false;
    }

    accepted ? answer = "Accepted" : answer = "Rejected";
  }
}
