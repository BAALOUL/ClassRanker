// ignore_for_file: avoid_types_as_parameter_names

import 'package:classRanker/view/students/getStudentsList.dart';
import 'package:classRanker/view/students/searchStudentsScreen.dart';
import 'package:classRanker/view/students/studentsHomeScreen.dart';
import 'package:classRanker/core/middleware/myMiddleware.dart';
import 'package:classRanker/test.dart';
import 'package:classRanker/view/screen/home/splash.dart';
import 'package:classRanker/view/screen/forgetPassword/forgetPassWord.dart';
import 'package:classRanker/view/screen/auth/langugeChange.dart';
import 'package:classRanker/view/screen/auth/login.dart';
import 'package:classRanker/view/screen/forgetPassword/resetPassWord.dart';
import 'package:classRanker/view/screen/auth/signUp.dart';
import 'package:classRanker/view/screen/auth/successSignUp.dart';
import 'package:classRanker/view/screen/auth/verefyCode.dart';
import 'package:classRanker/view/screen/home/profileType.dart';
import 'package:classRanker/view/screen/onboadring.dart';
import 'package:classRanker/view/screen/settings/contactUsScreen.dart';
import 'package:classRanker/view/screen/settings/settingsView.dart';
import 'package:classRanker/view/students/getStudentsByClass.dart';
import 'package:classRanker/view/students/createStudentScreen.dart';
import 'package:classRanker/view/students/editStudentScreen.dart';
import 'package:classRanker/view/students/studentDetailScreen.dart';
import 'package:classRanker/view/widgets/test_view.dart';
import 'package:get/get.dart';
import 'core/constant/consRoutes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Onboarding(),
      //page: () => const Onboarding(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: ConsRoutes.profileType, page: () => const ProfileTypeScreen()),

  GetPage(name: ConsRoutes.login, page: () => const Login()),
  GetPage(name: ConsRoutes.language, page: () => const LangugeChange()),
  GetPage(name: ConsRoutes.onBoarding, page: () => const Onboarding()),
  GetPage(name: ConsRoutes.signUp, page: () => const SignUp()),
  GetPage(name: ConsRoutes.forgetPassWord, page: () => const ForgetPassWord()),
  GetPage(name: ConsRoutes.resetPassWord, page: () => const ResetPassWord()),
  GetPage(name: ConsRoutes.verefyCode, page: () => VerefyCode()),
  GetPage(name: ConsRoutes.test, page: () => const Test()),
  GetPage(name: ConsRoutes.testView, page: () => const TestView()),
  GetPage(name: ConsRoutes.successSignUp, page: () => const SuccessSignUp()),

  GetPage(name: ConsRoutes.settingsView, page: () => const SettingsView()),

  GetPage(
      name: ConsRoutes.contactUsScreen, page: () => const ContactUsScreen()),

  GetPage(name: ConsRoutes.splash, page: () => const SplashScreen()),

  //GetPage(name: ConsRoutes.ocrView, page: () => OcrView()),

  // students
  //GetPage(name: ConsRoutes.studentDashboard, page: () => StudentDashboard()),
  GetPage(
      name: ConsRoutes.studentHomeScreen,
      page: () => const StudentHomeScreen()),

  GetPage(
      name: ConsRoutes.getstudentsListScreen,
      page: () => const GetStudentsListScreen()),

  GetPage(
      name: ConsRoutes.studentDetailScreen,
      page: () => const StudentDetailScreen()),

  GetPage(
      name: ConsRoutes.editStudentScreen,
      page: () => const EditStudentScreen()),

  GetPage(
      name: ConsRoutes.createStudentScreen,
      page: () => const CreateStudentScreen()),

  GetPage(
      name: ConsRoutes.searchStudentScreen, page: () => SearchStudentScreen()),

  GetPage(name: ConsRoutes.getStudentsList, page: () => GetStudentList()),
];
