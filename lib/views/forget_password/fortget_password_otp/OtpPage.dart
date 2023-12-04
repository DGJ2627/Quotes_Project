import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constant/text_string.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                CustomText.changeYourPasswordTitle,
                style: GoogleFonts.montserrat(
                    fontSize: 80,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Text(
                CustomText.changeYourPasswordTitle.toUpperCase(),
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              CustomText.changeYourPasswordTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            OtpTextField(
              numberOfFields: 4,
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              textStyle: const TextStyle(color: Colors.black),
              onSubmit: (code) {
                log("OTp is => $code");
              },
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                  Get.toNamed('/HomePage');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  "Next".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
