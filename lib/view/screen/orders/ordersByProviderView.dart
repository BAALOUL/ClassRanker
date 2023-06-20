import 'package:ecommerce_store/controller/orders/ordersByProviderController.dart';
import 'package:ecommerce_store/view/widgets/spacingBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingDataView.dart';
import '../booking/rejectionDialog.dart';
import '../home/titleCustom.dart';

class OrdersByProviderView extends GetView<OrdersByProviderControllerImp> {
  const OrdersByProviderView({
    Key? key,
  }) : super(key: key);

  void _showRejectionDialog(
      BuildContext context, String bookingId, String status) {
    RejectionDialog.show(context, (selectedReason) {
      OrdersByProviderControllerImp controller =
          Get.find<OrdersByProviderControllerImp>();
      controller.statusUpdate(bookingId, status, selectedReason);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersByProviderControllerImp());

    return Scaffold(
      body: GetBuilder<OrdersByProviderControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                Column(
                  children: [
                    const TitleCustom(
                      title: "My orders",
                    ),
                    CupertinoSegmentedControl<OrderStatus>(
                      children: const {
                        OrderStatus.all: Text('All'),
                        OrderStatus.completed: Text('Finished '),
                        OrderStatus.current: Text('Current'),
                        OrderStatus.canceled: Text('Canceled'),
                        OrderStatus.pending: Text('  Pending  '),
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
                    itemCount: controller.filteredOrders.length,
                    itemBuilder: (context, index) {
                      final booking = controller.filteredOrders[index];
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
                                      : booking['booking_status'] == 'canceled'
                                          ? Colors
                                              .red // Change color for canceled status
                                          : Colors.black, // Default color
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "Customer: ${booking['username']}",
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
                              if (booking['booking_status'] == 'completed')
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
                                    'Canceled',
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
                                    'Rejected',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (booking['booking_status'] == 'pending')
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.statusUpdate(
                                              booking['booking_id'],
                                              "current",
                                              "");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors
                                              .green, // Set button color to green
                                        ),
                                        child: const Text('Accept'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _showRejectionDialog(
                                              context,
                                              booking['booking_id'],
                                              "rejected"); // Call the rejection dialog
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors
                                              .red, // Set button color to red
                                        ),
                                        child: const Text('Reject'),
                                      ),
                                    ),
                                  ],
                                ),
                              if (booking['booking_status'] == 'current')
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.statusUpdate(
                                              booking['booking_id'],
                                              "completed",
                                              "");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors
                                              .green, // Set button color to green
                                        ),
                                        child: Text('Complete'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _showRejectionDialog(
                                              context,
                                              booking['booking_id'],
                                              "canceled");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors
                                              .red, // Set button color to red
                                        ),
                                        child: Text('Cancel'),
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
          ),
        ),
      ),
    );
  }
}
