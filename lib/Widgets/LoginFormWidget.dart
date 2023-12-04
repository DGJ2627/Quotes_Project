import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/SignIn_Controller.dart';
import '../views/forget_password/fortget_password_options/ShowBottomSheet.dart';
import '../views/screens/HomeScreens/HomePage.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                fillColor: Colors.black,
                prefixIcon: const Icon(CupertinoIcons.person),
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
            TextFormField(
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.black,
                prefixIcon: const Icon(CupertinoIcons.padlock_solid),
                label: const Text(
                  "Password",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  buildShowBottomSheet(context);
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  SignInController.instance.signInMethod(
                      controller.email.text,
                      controller.password.text,
                  );
                  Get.to(const HomePage());
                } else {
                  Get.defaultDialog(
                    title: "SignUp Failed",

                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  "Login".toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
