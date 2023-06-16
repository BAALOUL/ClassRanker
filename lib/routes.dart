// ignore_for_file: avoid_types_as_parameter_names

import 'package:ecommerce_store/core/middleware/myMiddleware.dart';
import 'package:ecommerce_store/test.dart';
import 'package:ecommerce_store/view/screen/auth/loginAsProviderScreen.dart';
import 'package:ecommerce_store/view/screen/auth/loginScreen.dart';
import 'package:ecommerce_store/view/screen/booking/booking.dart';
import 'package:ecommerce_store/view/screen/booking/bookingDecision.dart';
import 'package:ecommerce_store/view/screen/booking/bookingMessage.dart';
import 'package:ecommerce_store/view/screen/booking/bookingSummray.dart';
import 'package:ecommerce_store/view/screen/booking/bookingsByUserView.dart';
import 'package:ecommerce_store/view/screen/booking/problemDescriptionScreen.dart';
import 'package:ecommerce_store/view/screen/forgetPassword/forgetPassWord.dart';
import 'package:ecommerce_store/view/screen/auth/langugeChange.dart';
import 'package:ecommerce_store/view/screen/auth/login.dart';
import 'package:ecommerce_store/view/screen/forgetPassword/resetPassWord.dart';
import 'package:ecommerce_store/view/screen/auth/signUp.dart';
import 'package:ecommerce_store/view/screen/auth/successSignUp.dart';
import 'package:ecommerce_store/view/screen/auth/verefyCode.dart';
import 'package:ecommerce_store/view/screen/home/home.dart';
import 'package:ecommerce_store/view/screen/home/homeScreen.dart';
import 'package:ecommerce_store/view/screen/home/homeUser.dart';
import 'package:ecommerce_store/view/screen/home/profileType.dart';
import 'package:ecommerce_store/view/screen/onboadring.dart';
import 'package:ecommerce_store/view/screen/orders/ordersByProviderView.dart';
import 'package:ecommerce_store/view/screen/propertie/propertie.dart';
import 'package:ecommerce_store/view/screen/propertie/propertiesDetails.dart';
import 'package:ecommerce_store/view/screen/providers/providerAdd.dart';
import 'package:ecommerce_store/view/screen/providers/providerDetailView.dart';
import 'package:ecommerce_store/view/screen/providers/providerSignInOTP.dart';
import 'package:ecommerce_store/view/screen/providers/providersByServiceView.dart';
import 'package:ecommerce_store/view/screen/providers/updateLocationScreen.dart';
import 'package:ecommerce_store/view/screen/reviews/addReviewScreen.dart';
import 'package:ecommerce_store/view/screen/services/categoryView.dart';
import 'package:ecommerce_store/view/screen/services/sectionsView.dart';
import 'package:ecommerce_store/view/screen/services/servicesView.dart';
import 'package:ecommerce_store/view/screen/settings/addPaymentCardScreen.dart';
import 'package:ecommerce_store/view/screen/settings/contactUsScreen.dart';
import 'package:ecommerce_store/view/screen/settings/settingsView.dart';
import 'package:ecommerce_store/view/widgets/test_view.dart';
import 'package:get/get.dart';
import 'core/constant/consRoutes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const LangugeChange(),
      //page: () => const Onboarding(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: ConsRoutes.providersView,
      page: () => const ProvidersByServiceView()),
  GetPage(
      name: ConsRoutes.providerDetailView,
      page: () => const ProviderDetailsView()),
  GetPage(name: ConsRoutes.profileType, page: () => const ProfileTypeScreen()),
  GetPage(name: ConsRoutes.loginScrren, page: () => LoginScreen()),
  GetPage(
      name: ConsRoutes.loginAsProviderScrren,
      page: () => LoginAsProviderScreen()),
  GetPage(name: ConsRoutes.servicesView, page: () => const ServicesView()),
  GetPage(name: ConsRoutes.sectionsView, page: () => const SectionsView()),
  GetPage(name: ConsRoutes.categoryView, page: () => const CategoryView()),
  GetPage(name: ConsRoutes.homeUser, page: () => const HomeUser()),
  GetPage(name: ConsRoutes.booking, page: () => const BookingView()),
  GetPage(name: ConsRoutes.bookingSummary, page: () => const BookingSummary()),
  GetPage(
      name: ConsRoutes.bookingsByUser, page: () => const BookingsByUserView()),
  GetPage(
      name: ConsRoutes.bookingDecision, page: () => const BookingDecision()),
  GetPage(
      name: ConsRoutes.problemDescriptionScreen,
      page: () => const ProblemDescriptionScreen()),
  GetPage(name: ConsRoutes.bookingMessage, page: () => const BookingMessage()),
  GetPage(
      name: ConsRoutes.providerSignInView, page: () => ProviderSignInView()),
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
  GetPage(name: ConsRoutes.home, page: () => const Home()),
  GetPage(name: ConsRoutes.homescreen, page: () => const HomeScreen()),
  GetPage(name: ConsRoutes.properties, page: () => const Properties()),
  GetPage(
      name: ConsRoutes.propertiesDetails,
      page: () => const PropertiesDetails()),
  GetPage(name: ConsRoutes.settingsView, page: () => const SettingsView()),
  GetPage(name: ConsRoutes.addPaymentCard, page: () => AddPaymentCardScreen()),
  GetPage(
      name: ConsRoutes.provaiderLocationUpdate,
      page: () => ProviderLocationUpdateScreen()),
  GetPage(
      name: ConsRoutes.contactUsScreen, page: () => const ContactUsScreen()),
  GetPage(
      name: ConsRoutes.ordersByProvider,
      page: () => const OrdersByProviderView()),
  GetPage(
      name: ConsRoutes.providerAdd,
      page: () => const ProviderInformationView()),
  GetPage(name: ConsRoutes.addReview, page: () => AddReviewScreen()),
];
