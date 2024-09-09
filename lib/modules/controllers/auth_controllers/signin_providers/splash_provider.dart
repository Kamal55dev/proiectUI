import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashScreenControllerProvider =
    Provider((ref) => SplashScreenController());

class SplashScreenController {
  SplashScreenController();

  Future<void> init() async {
    // Perform any initialization logic here
    await Future.delayed(const Duration(seconds: 5)); // Simulate a delay
  }
}
