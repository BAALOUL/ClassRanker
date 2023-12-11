import 'package:classRanker/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/appointmentsController.dart';
import '../widgets/appointments/appointmentsList.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

//enum for appointment status

class _AppointmentPageState extends State<AppointmentPage> {
  //initial status
  Alignment _alignment = Alignment.centerLeft;

  //get appointments details
  AppointmentsControllerImp appointments = Get.put(AppointmentsControllerImp());

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules =
        appointments.schedules.where((var schedule) {
      switch (schedule['status']) {
        case 'upcoming':
          schedule['status'] = FilterStatus.upcoming;
          break;
        case 'complete':
          schedule['status'] = FilterStatus.complete;
          break;
        case 'cancel':
          schedule['status'] = FilterStatus.cancel;
          break;
      }
      return schedule['status'] == appointments.status;
    }).toList();

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: GetBuilder<AppointmentsControllerImp>(builder: (appointments) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Appointment Schedule',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //this is the filter tabs
                          for (FilterStatus filterStatus in FilterStatus.values)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  appointments.changeStatus(filterStatus);
                                  setState(() {
                                    _alignment = appointments
                                        .alignmentForStatus(filterStatus);
                                  });
                                },
                                child: Center(
                                  child: Text(filterStatus.name),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    AnimatedAlign(
                      alignment: _alignment,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Config.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            appointments.status.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                GetBuilder<AppointmentsControllerImp>(builder: (appointments) {
                  return Expanded(
                    child: ListItems(filteredSchedules: filteredSchedules),
                  );
                })
              ],
            );
          })),
    );
  }
}
