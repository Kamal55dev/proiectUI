import 'dart:developer';
import 'package:badminton/modules/coach_module/coach_home/coach_home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/signin_module/login2.dart';
import '../../../authentication/signup_module/signup.dart';

final loginControllerProvider = Provider((ref) => LoginController());

class LoginController {
  final TextEditingController emailOrMobileController = TextEditingController();

  void login(BuildContext context) {
    if (kDebugMode) {
      print("User logged in");
    }
    log(emailOrMobileController.text);
    if (emailOrMobileController.text == 'coach@gmail.com') {
      log("Comes here");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RAKMainScreen()),
      );
    } else if (emailOrMobileController.text == 'player@gmail.com') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RAKMainScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login2()),
      );
    }
  }

  void navigateToCreateAccount(BuildContext context) {
    if (kDebugMode) {
      print("Navigate to Create Account");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Signup()),
    );
  }

  void signUpWithGoogle() {
    if (kDebugMode) {
      print("Google sign up");
    }
  }

  void signUpWithFacebook() {
    if (kDebugMode) {
      print("Facebook sign up");
    }
  }

  void signUpWithApple() {
    if (kDebugMode) {
      print("Apple sign up");
    }
  }

  getOtp(BuildContext context) {}
}
