import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Image_String.dart';
import '../../../Constant/text_string.dart';
import '../../../Controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImagePath.appLogo),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(CustomText.appTagLine,style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.black),),
          const CircularProgressIndicator(),
          const SizedBox(height: 150,),
        ],
      ),
    );
  }
}
