import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/signin_module/login2.dart';
import '../../../authentication/signup_module/signup.dart';

final loginControllerProvider = Provider((ref) => LoginController());

class LoginController {
  get emailOrMobileController => null;

  void login(BuildContext context) {
    if (kDebugMode) {
      print("User logged in");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login2()),
    );
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
