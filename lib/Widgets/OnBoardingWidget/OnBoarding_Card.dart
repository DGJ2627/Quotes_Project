import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constant/Colors.dart';
import 'Onboaring_Imagelist.dart';

class OnboardingCard extends StatelessWidget {
  final List<OnBoarding> onBoardingList;
  final int currentIndex;
  PageController pageController;

  OnboardingCard({
    Key? key,
    required this.onBoardingList,
    required this.currentIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.kGrey3Color,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 35, right: 34),
              child: Text(
                pageViewList[currentIndex].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kLightAccentColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: DotsIndicator(
                dotsCount: pageViewList.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  color: Colors.grey.withOpacity(0.5),
                  size: const Size.square(8.0),
                  activeSize: const Size(20.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: AppColor.kPrimary,
                ),
              ),
            ),
          ],
        ));
  }
}


