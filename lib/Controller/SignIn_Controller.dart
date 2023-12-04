import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Authentication/AuthenticationRepo.dart';

class SignInController {
  static SignInController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();

  void signInMethod(String email, String password) {
    AuthenticationRepo.instance.loginUserWithEmailAndPassword(email, password);
  }
}