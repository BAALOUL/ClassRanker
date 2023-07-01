import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/radiusText.dart';
import 'package:ecommerce_store/view/widgets/spacingBar.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/booking/bookingController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SelectDate extends GetView<BookingControllerImp> {
  SelectDate({super.key});
  late DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 160,
              height: 45,
              child: DropdownSearch<String>(
                dropdownSearchDecoration: const InputDecoration(
                  //labelText: 'Select Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:
                        BorderSide(color: ConsColors.yellow, width: 2.0),
                  ),
                  filled: true,
                  fillColor: ConsColors.blueWhite,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                mode: Mode.MENU,
                items: const [
                  "Today",
                  "Tomorrow",
                  "This week",
                  "Next week",
                  "Next month",
                ],
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: (selectedItem) {
                  print('Selected item: $selectedItem');
                  controller.updateDate(selectedItem!);
                },
                selectedItem: "Tomorrow",
              ),
            ),

            // picker date
            SizedBox(
              width: 160,
              height: 45,
              child: CustomButton(
                text: "Pick a date",
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  ).then((selectedDate) {
                    // Do something with selectedDate
                    if (selectedDate != null) {
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(selectedDate);

                      controller.dateSelected = formattedDate;
                      controller.update();
                    }
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        RadiusText(text: controller.dateSelected),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
