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
              width: 150,
              height: 36,
              child: DropdownSearch<String>(
                mode: Mode.MENU,
                items: const [
                  "Today",
                  "Tommorow",
                  "This week",
                  "Next week",
                  "Next month",
                ],
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: (selectedItem) {
                  print('Selected item: $selectedItem');
                  controller.updateDate(selectedItem!);
                },
                selectedItem: "Tommorow",
              ),
            ),
            // text or

            const Text(
              'or',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // picker date
            ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 148, 64, 72)),
                child: const Text('Pick a date')),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              controller.dateSelected,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 17, 159, 39),
                fontFamily: 'Cairo', // Use the 'Cairo' font family
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
