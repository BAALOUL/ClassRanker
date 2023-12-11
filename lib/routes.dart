// ignore_for_file: avoid_types_as_parameter_names

import 'package:classRanker/core/middleware/myMiddleware.dart';
import 'package:classRanker/test.dart';
import 'package:classRanker/view/screen/booking.dart';
import 'package:classRanker/view/screen/doctorDetails.dart';
import 'package:classRanker/view/screen/forgetPassword/forgetPassWord.dart';
import 'package:classRanker/view/screen/auth/langugeChange.dart';
import 'package:classRanker/view/screen/auth/login.dart';
import 'package:classRanker/view/screen/forgetPassword/resetPassWord.dart';
import 'package:classRanker/view/screen/auth/signUp.dart';
import 'package:classRanker/view/screen/home/mainLayout.dart';
import 'package:classRanker/view/screen/onboadring.dart';
import 'package:classRanker/view/screen/settings/contactUsScreen.dart';
import 'package:classRanker/view/screen/settings/settingsView.dart';
import 'package:classRanker/view/widgets/test_view.dart';
import 'package:get/get.dart';
import 'core/constant/consRoutes.dart';
import 'view/screen/favoritePage.dart';
import 'view/screen/home/homePage.dart';
import 'view/screen/profile_page.dart';
import 'view/screen/successBookingScreen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Onboarding(),
      //page: () => const Onboarding(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: ConsRoutes.login, page: () => const Login()),
  GetPage(name: ConsRoutes.language, page: () => const LangugeChange()),
  GetPage(name: ConsRoutes.onBoarding, page: () => const Onboarding()),
  GetPage(name: ConsRoutes.signUp, page: () => const SignUp()),
  GetPage(name: ConsRoutes.forgetPassWord, page: () => const ForgetPassWord()),
  GetPage(name: ConsRoutes.resetPassWord, page: () => const ResetPassWord()),
  GetPage(name: ConsRoutes.test, page: () => const Test()),
  GetPage(name: ConsRoutes.testView, page: () => const TestView()),
  GetPage(name: ConsRoutes.settingsView, page: () => const SettingsView()),
  GetPage(
      name: ConsRoutes.contactUsScreen, page: () => const ContactUsScreen()),
  GetPage(name: ConsRoutes.homePage, page: () => const HomePage()),
  GetPage(name: ConsRoutes.doctorDetails, page: () => const DoctorDetails()),
  GetPage(name: ConsRoutes.mainLayout, page: () => MainLayout()),
  GetPage(name: ConsRoutes.favoritePage, page: () => const FavoritePage()),
  GetPage(name: ConsRoutes.bookingPage, page: () => BookingPage()),
  GetPage(name: ConsRoutes.successBooking, page: () => const SuccessBooking()),
  GetPage(name: ConsRoutes.profilePage, page: () => const ProfilePage()),
];
