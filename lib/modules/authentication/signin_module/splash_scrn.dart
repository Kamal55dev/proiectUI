import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth_controllers/signin_providers/splash_provider.dart';
import 'login.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start initialization process
    ref.read(splashScreenControllerProvider).init().then((_) {
      // Navigate to home screen or appropriate screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Column(
            children: [
              // Background image on top with fixed height
              Image.asset(
                'assets/images/bg_images/Looper BG.png', // Replace with your background image asset path
                fit: BoxFit.cover,
                height: screenHeight *
                    0.4, // Keep fixed height relative to screen height
                width: screenWidth,
              ),
              // Foreground content (logo and text) below the image
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo image with fixed size
                      Image.asset(
                        'assets/images/Group 1171277302.png',
                        width: 140,
                        height: 132,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Innovation by',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Text(
                        'Ulchemy',
                        style: TextStyle(
                          color: Color(0xFFFFD700), // Gold color for "Ulchemy"
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
