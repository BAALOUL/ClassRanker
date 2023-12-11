import 'package:classRanker/controller/auth/authController.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:shared_preferences/shared_preferences.dart";

import '../../config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.put(AuthController());

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            height: 300, // Specify a fixed height for the first section
            color: Config.primaryColor,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                const CircleAvatar(
                  radius: 65.0,
                  backgroundImage: AssetImage('assets/profile1.jpg'),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${auth.getUser['name']}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '23 Years Old | Female',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 300, // Specify a fixed height for the second section
              color: Colors.grey[200],
              child: Center(
                child: ProfileCard(auth: auth),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.auth,
  }) : super(key: key);

  final AuthController auth;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
      child: Container(
        width: 300,
        height: 260,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Divider(
                color: Colors.grey[300],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blueAccent[400],
                    size: 35,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.yellowAccent[400],
                    size: 35,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "History",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.lightGreen[400],
                    size: 35,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      final token = prefs.getString('token') ?? '';
                      if (token.isNotEmpty && token != '') {
                        //logout here
                        final response = await auth.logout(token);
                        if (response == 200) {
                          //if successfully delete access token
                          //then delete token saved at Shared Preference as well
                          await prefs.remove('token');
                          Get.offAndToNamed(ConsRoutes.login);
                        }
                      }
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
