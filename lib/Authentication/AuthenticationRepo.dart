import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/views/Login/LoginPage.dart';
import 'package:final_project/views/screens/HomeScreens/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../exceptions/Signup_emailpassword_fail.dart';


class AuthenticationRepo extends GetxController {
 static AuthenticationRepo get instance => Get.find();
  final auth = FirebaseAuth.instance;
  final fireBaseFireStore = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3));
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(const LoginPage())
        : Get.offAll(const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // firebaseUser.value != null ? Get.offAllNamed('/HomePage') : Get.offAllNamed('/WelcomePage');
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      log('FIREBASE AUTH EXCEPTION : ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailPasswordFailure();
      log('FIREBASE AUTH EXCEPTION : ${ex.message}');
      throw ex;
    }
  }


  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      log('FIREBASE AUTH EXCEPTION : ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailPasswordFailure();
      log('FIREBASE AUTH EXCEPTION : ${ex.message}');
    }
  }


  Future<void> logOut() async => await auth.signOut();


}
