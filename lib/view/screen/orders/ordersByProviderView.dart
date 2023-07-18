import 'package:ecommerce_store/controller/orders/ordersByProviderController.dart';
import 'package:ecommerce_store/view/widgets/spacingBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/class/handlingDataView.dart';
import '../../../core/constant/consColors.dart';
import '../../../core/services/services.dart';
import '../../widgets/customButtonReaction.dart';
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
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    Get.put(OrdersByProviderControllerImp());

    return Scaffold(
      body: GetBuilder<OrdersByProviderControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Column(
                  children: [
                    TitleCustom(
                      title: "My orders".tr,
                    ),
                    ordersFilter(controller),
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
                          title: tileAction(savedLang, booking),
                          subtitle: tileContente(booking, controller, context),
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

  CupertinoSegmentedControl<OrderStatus> ordersFilter(
    OrdersByProviderControllerImp controller,
  ) {
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString('lang');

    return CupertinoSegmentedControl<OrderStatus>(
      selectedColor: ConsColors.yellow,
      borderColor: ConsColors.yellow,
      children: {
        OrderStatus.all: Text(
          'All'.tr,
          style: TextStyle(
            color: ConsColors.blue,
            fontSize: savedLang == 'en' ? 13 : 15,
          ),
        ),
        OrderStatus.completed: Text(
          'Finished'.tr,
          style: TextStyle(
            color: ConsColors.blue,
            fontSize: savedLang == 'en' ? 13 : 15,
          ),
        ),
        OrderStatus.current: Text(
          'Current'.tr,
          style: TextStyle(
            color: ConsColors.blue,
            fontSize: savedLang == 'en' ? 13 : 15,
          ),
        ),
        OrderStatus.canceled: Text(
          'Canceled'.tr,
          style: TextStyle(
            color: ConsColors.blue,
            fontSize: savedLang == 'en' ? 13 : 15,
          ),
        ),
        OrderStatus.pending: Text(
          'Pending'.tr,
          style: TextStyle(
            color: ConsColors.blue,
            fontSize: savedLang == 'en' ? 13 : 15,
          ),
        ),
      },
      groupValue: controller.selectedStatus,
      onValueChanged: (status) {
        controller.onStatusSelected(status);
      },
    );
  }

  Column tileAction(String? savedLang, booking) {
    return Column(
      children: [
        Text(
          savedLang == "en"
              ? "${booking['service_name']}"
              : "${booking['service_name_ar']}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: booking['booking_status'] == 'completed'
                ? Colors.green // Change color for completed status
                : booking['booking_status'] == 'canceled'
                    ? Colors.red // Change color for canceled status
                    : Colors.black, // Default color
          ),
        ),
      ],
    );
  }

  Row tileContente(
      booking, OrdersByProviderControllerImp controller, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: orderInformations(booking),
          ),
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
                  width: 120,
                  child: CustomButtonReaction(
                    status: 'accept',
                    onPressed: () {
                      controller.statusUpdate(
                          booking['booking_id'], "current", "");
                    },
                  )),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: 120,
                  child: CustomButtonReaction(
                    status: 'reject',
                    onPressed: () {
                      _showRejectionDialog(
                          context, booking['booking_id'], "rejected");
                    },
                  )),
            ],
          ),
        if (booking['booking_status'] == 'current')
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                  width: 120,
                  child: CustomButtonReaction(
                    status: 'complete',
                    onPressed: () {
                      controller.statusUpdate(
                          booking['booking_id'], "completed", "");
                    },
                  )),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: 120,
                  child: CustomButtonReaction(
                    status: 'cancel',
                    onPressed: () {
                      _showRejectionDialog(
                          context, booking['booking_id'], "canceled");
                    },
                  )),
            ],
          ),
      ],
    );
  }

  Column orderInformations(booking) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${"Date".tr} : ${booking['booking_date']}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${"Location".tr} : ${booking['booking_adress']}",
          style: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
          maxLines: null,
        ),
        Text(
          "${"Customer".tr} : ${booking['username']}",
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          Jiffy(booking['booking_savetime']).fromNow(),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
