import 'package:ecommerce_store/controller/booking/bookingByUserController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/screen/booking/rejectionDialog.dart';
import 'package:ecommerce_store/view/widgets/customButtonReaction.dart';
import 'package:ecommerce_store/view/widgets/spacingBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/class/handlingDataView.dart';
import '../home/titleCustom.dart';

class BookingsByUserView extends GetView<BookingsByUserControllerImp> {
  const BookingsByUserView({
    Key? key,
  }) : super(key: key);

  void _showRejectionDialog(
      BuildContext context, String bookingId, String status, String provId) {
    RejectionDialog.show(context, (selectedReason) {
      BookingsByUserControllerImp controller =
          Get.find<BookingsByUserControllerImp>();
      print(
          "Boooooooking Id : $bookingId \n Status :  $status \n provId: $provId \n reason: $selectedReason");
      controller.statusUpdate(bookingId, status, provId, selectedReason);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BookingsByUserControllerImp());
    //
    return Scaffold(
        body: GetBuilder<BookingsByUserControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const TitleCustom(
                            title: "Bookings",
                          ),
                          // Segmented Control
                          CupertinoSegmentedControl<BookingStatus>(
                            selectedColor: ConsColors.yellow,
                            borderColor: ConsColors.yellow,
                            //unselectedColor: ConsColors.blue,
                            children: const {
                              BookingStatus.all: Text(
                                ' All ',
                                style: TextStyle(color: ConsColors.blue),
                              ),
                              BookingStatus.completed: Text(
                                'Finished',
                                style: TextStyle(color: ConsColors.blue),
                              ),
                              BookingStatus.current: Text(
                                '  Current  ',
                                style: TextStyle(color: ConsColors.blue),
                              ),
                              BookingStatus.canceled: Text(
                                'Canceled ',
                                style: TextStyle(color: ConsColors.blue),
                              ),
                              BookingStatus.pending: Text(
                                '  Pending  ',
                                style: TextStyle(color: ConsColors.blue),
                              ),
                            },
                            groupValue: controller.selectedStatus,
                            onValueChanged: (status) {
                              controller.onStatusSelected(status);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SpacingBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.filteredBookings.length,
                          itemBuilder: (context, index) {
                            final booking = controller.filteredBookings[index];
                            return InkWell(
                              onTap: () {
                                // Navigate to provider details screen
                              },
                              child: ListTile(
                                title: Column(
                                  children: [
                                    Text(
                                      "${booking['service_name']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ConsColors.blue, // Default color
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Date: ${booking['booking_date']}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "City: ${booking['booking_adress']}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            maxLines: null,
                                          ),
                                          Text(
                                            "Provider: ${booking['provider_name']}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            //  "Done: ${Jiffy(booking['booking_savetime'], "yyyy/MM/dd").format("MMMM do yyyy, h:mm:ss a")}",
                                            Jiffy(booking['booking_savetime'])
                                                .fromNow(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (booking['booking_status'] ==
                                        'completed')
                                      const Center(
                                        child: Text(
                                          'Completed',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'canceled')
                                      const Center(
                                        child: Text(
                                          'canceled',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'rejected')
                                      const Center(
                                        child: Text(
                                          'rejected',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'pending')
                                      const Center(
                                        child: Text(
                                          'Pending',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ConsColors.yellow,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'current')
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                              width: 120,
                                              child: CustomButtonReaction(
                                                status: 'complete',
                                                height: 35,
                                                size: 12,
                                                onPressed: () {
                                                  controller.statusUpdate(
                                                      booking['booking_id'],
                                                      "completed",
                                                      booking[
                                                          'booking_provider_id'],
                                                      "");
                                                },
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                              width: 120,
                                              child: CustomButtonReaction(
                                                status: 'cancel',
                                                height: 35,
                                                size: 12,
                                                onPressed: () {
                                                  _showRejectionDialog(
                                                      context,
                                                      booking['booking_id'],
                                                      "canceled",
                                                      booking[
                                                          'booking_provider_id']);
                                                },
                                              )),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ))));
  }
}

/*class BookingsByUserView extends GetView<BookingsByUserControllerImp> {
  const BookingsByUserView({
    Key? key,
  }) : super(key: key);

  void _showRejectionDialog(
      BuildContext context, String bookingId, String status, String provId) {
    RejectionDialog.show(context, (selectedReason) {
      BookingsByUserControllerImp controller =
          Get.find<BookingsByUserControllerImp>();
      print(
          "Boooooooking Id : $bookingId \n Status :  $status \n provId: $provId \n reason: $selectedReason");
      controller.statusUpdate(bookingId, status, provId, selectedReason);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BookingsByUserControllerImp());
    //
    return Scaffold(
        body: GetBuilder<BookingsByUserControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const TitleCustom(
                            title: "Bookings",
                          ),
                          // Segmented Control
                          CupertinoSegmentedControl<BookingStatus>(
                            children: const {
                              BookingStatus.all: Text('  All  '),
                              BookingStatus.completed: Text('  Completed  '),
                              BookingStatus.current: Text('  Current  '),
                              BookingStatus.canceled: Text('  Canceled  '),
                            },
                            groupValue: controller.selectedStatus,
                            onValueChanged: (status) {
                              controller.onStatusSelected(status);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SpacingBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 210,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.filteredBookings.length,
                          itemBuilder: (context, index) {
                            final booking = controller.filteredBookings[index];
                            return InkWell(
                              onTap: () {
                                // Navigate to provider details screen
                              },
                              child: ListTile(
                                title: Column(
                                  children: [
                                    Text(
                                      "${booking['service_name']}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: booking['booking_status'] ==
                                                'completed'
                                            ? Colors
                                                .green // Change color for completed status
                                            : booking['booking_status'] ==
                                                    'canceled'
                                                ? Colors
                                                    .red // Change color for canceled status
                                                : Colors.black, // Default color
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date: ${booking['booking_date']}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "City: ${booking['booking_adress']}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          "Provider: ${booking['provider_name']}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "Done: ${booking['booking_savetime']}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (booking['booking_status'] ==
                                        'completed')
                                      const Center(
                                        child: Text(
                                          'Completed',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'canceled')
                                      const Center(
                                        child: Text(
                                          'canceled',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'rejected')
                                      const Center(
                                        child: Text(
                                          'rejected',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    if (booking['booking_status'] == 'current')
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 90,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                controller.statusUpdate(
                                                    booking['booking_id'],
                                                    "completed",
                                                    booking[
                                                        'booking_provider_id'],
                                                    "");
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors
                                                    .green, // Set button color to green
                                              ),
                                              child: const Text('Complete'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 90,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _showRejectionDialog(
                                                    context,
                                                    booking['booking_id'],
                                                    "canceled",
                                                    booking[
                                                        'booking_provider_id']);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors
                                                    .red, // Set button color to red
                                              ),
                                              child: const Text('Cancel'),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ))));
  }
}
*/