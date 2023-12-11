import 'package:classRanker/controller/mainLayoutController.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/view/screen/appointment.dart';
import 'package:classRanker/view/screen/favoritePage.dart';
import 'package:classRanker/view/screen/home/homePage.dart';
import 'package:classRanker/view/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  final MainLayoutController controller = Get.put(MainLayoutController());

  MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.changePage(value);
          },
          children: const <Widget>[
            HomePage(),
            FavoritePage(),
            AppointmentPage(),
            ProfilePage(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GetBuilder<MainLayoutController>(
          builder: (controller) {
            return BottomAppBar(
              notchMargin: 5,
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              shape: const CircularNotchedRectangle(),
              child: BottomNavigationBar(
                // Set the selected item color here
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.solidHeart),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
                    label: 'Appointments',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.solidUser),
                    label: 'Profile',
                  ),
                ],
                currentIndex: controller.currentPage,
                onTap: (page) {
                  controller.changePage(page);
                  controller.pageController.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            );
          },
        ));
  }
}























      /* bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ConsColors.yellow,
        currentIndex: controller.currentPage,
        onTap: (page) {
          controller.changePage(page);
          controller.pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidHeart),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: 'Profile',
          ),
        ],
      ),*/
