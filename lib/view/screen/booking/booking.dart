import 'package:ecommerce_store/controller/booking/bookingController.dart';
import 'package:ecommerce_store/view/screen/booking/components/richTextBooking.dart';
import 'package:ecommerce_store/view/screen/booking/components/selectDate.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/simpleTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/consColors.dart';
import '../../widgets/sections/firstRowBackArrow.dart';
import '../../widgets/spacingBar.dart';
import '../../widgets/titleCustomBig.dart';
import 'components/getLocation.dart';

class BookingView extends StatelessWidget {
  const BookingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingControllerImp());

    return Scaffold(
        body: GetBuilder<BookingControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    color: ConsColors.blueWhite,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        FirstRowBackArrow(),
                        Text(
                          'Booking',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ConsColors.blue),
                        ),
                        SizedBox(height: 8),
                        RichTextBooking(),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 200),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    children: [
                      const TitleCustomBig(title: "Select a date"),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectDate(),
                      const SizedBox(
                        height: 10,
                      ),
                      const SpacingBar(),
                      const TitleCustomBig(
                        title: "Select your location",
                      ),
                      const GetLocation(),
                      const TitleCustomBig(
                        title: "Additional informatios",
                        size: 18,
                      ),
                      const TitleCustomBig(
                        title: "Appartment",
                        size: 15,
                      ),
                      const SimpleTextFieldCustom(typeT: "appartment"),
                      const TitleCustomBig(
                        title: "Floor",
                        size: 15,
                      ),
                      const SimpleTextFieldCustom(typeT: "floor"),
                      const TitleCustomBig(
                        title: "House N°",
                        size: 15,
                      ),
                      const SimpleTextFieldCustom(typeT: "houseN"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: "Continue",
                        onPressed: () {
                          controller.goToProblemDescription();
                        },
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}

/* 
ListView(
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Booking',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const RichTextBooking(),
                    const SpacingBar(),
                    const TitleSelectDate(),
                    const SizedBox(
                      height: 20,
                    ),
                    SelectDate(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SpacingBar(),
                    const GetLocation(),
                    const SizedBox(height: 30),
                    const AdditionalInformations(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ])
 */
