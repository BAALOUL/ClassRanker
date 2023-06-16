import 'package:ecommerce_store/core/constant/consImageAssets.dart';
import 'package:ecommerce_store/data/model/onboardingModel.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
      title:
          'أطلب مني منصة تربط بين العملاء ومقدمي الخدمات \n  يتيح للمستخدمين طلب الخدمات وتوظيفها بأفضل الأسعار',
      image: ConsImageAssets.OnBoardingOne,
      content: 'المنصة'),
  OnboardingModel(
      title: 'نوفر للعملاء حل مريح، مفيدوسريع\n لطلب وإنجاز خدماتهم',
      image: ConsImageAssets.OnBoardingTwo,
      content: 'العملاء'),
  OnboardingModel(
      title: 'توسيع قاعدة العملاء \n وعرض الخبرة',
      image: ConsImageAssets.OnBoardingThree,
      content: 'مقدمي الخدمات')
];
