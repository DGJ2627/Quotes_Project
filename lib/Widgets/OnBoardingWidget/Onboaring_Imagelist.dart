import '../../Constant/Image_String.dart';
import '../../Constant/text_string.dart';

class OnBoarding {
  String title;
  String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> pageViewList = [
  OnBoarding(
    title:
    CustomText.onBoardingTitle1,
    image: AppImagePath.kOnboarding1,
  ),
  OnBoarding(
    title:
    CustomText.onBoardingTitle2,
    image: AppImagePath.kOnboarding2,
  ),
  OnBoarding(
    title:
    CustomText.onBoardingTitle3,
    image: AppImagePath.kOnboarding3,
  ),
];