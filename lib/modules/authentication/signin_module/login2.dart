import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth_controllers/signin_providers/l2_provider.dart';

class Login2 extends ConsumerWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            top: 2,
            child: Image.asset(
              'assets/images/bg_images/Looper BG.png', // Replace with your background image asset
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    // Logo
                    Image.asset(
                      'assets/images/Group 1171277302.png', // Replace with your logo asset
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 120),

                    // Login Text
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Subtitle Text
                    const Text(
                      'Welcome back! Please enter your details.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email or Mobile Input Field
                    TextField(
                      controller: loginController.emailOrMobileController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter Email ID or Mobile No.',
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Get OTP Button
                    ElevatedButton(
                      onPressed: () => loginController.getOtp(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFFDAA520), // Gold color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Get OTP',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 55),

                    // OR Text
                    const Text(
                      'or',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 10),

                    // Social Media Login Options
                    const Text(
                      'Login using',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google Icon
                        IconButton(
                          icon: Image.asset(
                              'assets/images/google.png'), // Replace with your asset
                          iconSize: 40,
                          onPressed: loginController.signUpWithGoogle,
                        ),
                        const SizedBox(width: 20),
                        // Facebook Icon
                        IconButton(
                          icon: Image.asset(
                              'assets/images/fb.png'), // Replace with your asset
                          iconSize: 40,
                          onPressed: loginController.signUpWithFacebook,
                        ),
                        const SizedBox(width: 20),
                        // Apple Icon
                        IconButton(
                          icon: Image.asset(
                              'assets/images/ios.png'), // Replace with your asset
                          iconSize: 40,
                          onPressed: loginController.signUpWithApple,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Footer Text
                    const Text(
                      'Innovation by',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const Text(
                      'Ulchemy',
                      style: TextStyle(
                        color: Color(0xFFDAA520), // Gold color
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
