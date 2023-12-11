import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:get/get.dart';

import '../../../config.dart';
import 'package:flutter/material.dart';

import '../../links.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.isFav,
  }) : super(key: key);

  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.screenWidth! * 0.33,
                child: doctor['doctor_profile'] != null
                    ? Image(
                        image: doctor['doctor_profile'] != null
                            ? const AssetImage('assets/placeholder.jpg')
                            : const AssetImage(
                                'assets/profile1.jpg'), // Provide a placeholder image
                        fit: BoxFit
                            .fill, // You can set the fit mode as per your requirements
                      )

                    /*Image.network(
                        "${Links.storage}${doctor['doctor_profile']}",
                        fit: BoxFit.fill,
                      )*/
                    : Image.asset(
                        'assets/placeholder.jpg',
                        fit: BoxFit.fill,
                      ),
              ),

              /*Image(
                    image: doctor['doctor_profile'] != null
                        ? const AssetImage('assets/placeholder.jpg')
                        : const AssetImage(
                            'assets/profile1.jpg'), // Provide a placeholder image
                    fit: BoxFit
                        .fill, // You can set the fit mode as per your requirements
                  )),*/

              // Placeholder or any other UI element for no image

              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dr ${doctor['doctor_name']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${doctor['category']}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text('4.5'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Reviews'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('(20)'),
                          Spacer(
                            flex: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          //pass the details to detail page

          Get.toNamed(
            ConsRoutes.doctorDetails,
            arguments: {'doctor': doctor, 'isFav': isFav},
          );
        },
      ),
    );
  }
}
