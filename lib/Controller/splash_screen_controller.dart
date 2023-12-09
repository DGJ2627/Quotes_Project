import 'dart:async';
import 'package:final_project/views/screens/OnBoardingScreens/OnBoarding_Screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    animate.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Get.to(const OnBoardingScreen());
  }
}