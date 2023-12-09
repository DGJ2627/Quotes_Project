import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/Colors.dart';
import '../../../Widgets/OnBoardingWidget/OnBoarding_Card.dart';
import '../../../Widgets/OnBoardingWidget/Onboaring_Imagelist.dart';
import '../../Login/LoginPage.dart';
import 'Primary_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController(initialPage: 0,);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBGColor,
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding:
                const EdgeInsets.only(left: 61.65, right: 43.75, top: 121.76),
                child: Image(image: AssetImage(pageViewList[_currentIndex].image),),
              )),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: pageViewList.length,
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;

                          });
                        },
                        itemBuilder: (context, index) {
                          return OnboardingCard(
                            onBoardingList: pageViewList,
                            currentIndex: index,
                            pageController: pageController,
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding:
        const EdgeInsets.only(top: 65, left: 32, right: 32, bottom: 40),
        child: PrimaryButton(
          onTap: () {
            if (_currentIndex == 2) {
              Get.to((const LoginPage()));
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            }
          },
          text: _currentIndex == pageViewList.length - 1
              ? 'Get Started'
              : 'Continue',
          bgColor: AppColor.kPrimary,
          borderRadius: 8,
          height: 48,
          width: 326,
          textColor: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}














