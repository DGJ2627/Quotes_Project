import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Image_String.dart';

class ForgetPassWordMail_Page extends StatelessWidget {
  const ForgetPassWordMail_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: 400,
                    child: Image.asset(AppImagePath.ForgetPasswordImage),
                  ),
                ),
                const Text(
                  "Forget Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter Your Email For Verification",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          label: const Text(
                            "Email",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          // hintText: "Email",
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          // fillColor: Colors.black,
                          suffixIconColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/OtpPage');
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
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
