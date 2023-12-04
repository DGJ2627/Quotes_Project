import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/Image_String.dart';
import '../Constant/text_string.dart';


class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage(AppImagePath.welcomeImage),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          CustomText.loginTitle,
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          CustomText.loginSubTitle,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}