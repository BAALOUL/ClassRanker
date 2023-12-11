import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../config.dart';
import '../../../controller/auth/authController.dart';
import '../../../controller/homePageController.dart';
import '../../../core/constant/consColors.dart';
import '../../components/appointment_card.dart';
import '../../components/doctor_card.dart';
import '../../widgets/appBar/firstRowBackArrow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageControllerImp controller = Get.put(HomePageControllerImp());
  @override
  Widget build(BuildContext context) {
    // Access the controller instance:
    AuthController authController = Get.find<AuthController>();

    // Now you can access the data using the controller:
    Map<String, dynamic> user = authController.getUser;
    Map<String, dynamic> appointment = authController.getAppointment;
    List<dynamic> favList = authController.getFav;

    return Scaffold(
        body: SafeArea(
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
                children: [
                  //FirstRowBackArrow(),
                  Config.spaceSmall,
                  homeAppBar(user: user),
                  Config.spaceSmall,
//category
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Config.spaceSmall,
                  category(controller: controller),
                  const SizedBox(height: 8),
                  //const RichTextBooking(),
                ],
              ),
            ),
          ),
          Positioned(
              top: 230,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: user.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Config.spaceSmall,
                              const Text(
                                'Appointment Today',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Config.spaceSmall,
                              controller.doctor.isNotEmpty
                                  ? AppointmentCard(
                                      doctor: controller.doctor,
                                      color: Config.primaryColor,
                                    )
                                  : Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                            'No Appointment Today',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              Config.spaceSmall,
                              const Text(
                                'Top Doctors',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Config.spaceSmall,
                              Column(
                                children: List.generate(user['doctor'].length,
                                    (index) {
                                  return DoctorCard(
                                    doctor: user['doctor'][index],
                                    //if lates fav list contains particular doctor id, then show fav icon
                                    isFav: favList.contains(
                                            user['doctor'][index]['doc_id'])
                                        ? true
                                        : false,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
              ))
        ],
      ),
    ));
  }
}

class category extends StatelessWidget {
  const category({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomePageControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config.screenHeight! * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(controller.medCat.length, (index) {
          return Card(
            margin: const EdgeInsets.only(right: 20),
            color: Config.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FaIcon(
                    controller.medCat[index]['icon'],
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    controller.medCat[index]['category'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class homeAppBar extends StatelessWidget {
  const homeAppBar({
    Key? key,
    required this.user,
  }) : super(key: key);

  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          user['name'],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile1.jpg'),
          ),
        )
      ],
    );
  }
}
