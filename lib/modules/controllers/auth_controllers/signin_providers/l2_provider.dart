import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/signin_module/otp.dart';

final loginControllerProvider =
    ChangeNotifierProvider((ref) => LoginController());

class LoginController extends ChangeNotifier {
  final TextEditingController emailOrMobileController = TextEditingController();

  void getOtp(BuildContext context) {
    // Implement the OTP logic here
    if (kDebugMode) {
      print('OTP requested for: ${emailOrMobileController.text}');
    }
    //Navigate to OtpScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Otp()),
    );
  }

  void signUpWithGoogle() {
    // Implement Google sign-up logic
    if (kDebugMode) {
      print('Google sign-up initiated');
    }
  }

  void signUpWithFacebook() {
    // Implement Facebook sign-up logic
    if (kDebugMode) {
      print('Facebook sign-up initiated');
    }
  }

  void signUpWithApple() {
    // Implement Apple sign-up logic
    if (kDebugMode) {
      print('Apple sign-up initiated');
    }
  }
}
