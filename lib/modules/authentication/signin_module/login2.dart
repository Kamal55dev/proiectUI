import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth_controllers/signin_providers/login_provider.dart';

class Login2 extends ConsumerWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loginController = ref.watch(loginControllerProvider);
    final loginController = ref.watch(loginControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              // Background Image with adjustable height
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: screenHeight * 0.4, // 40% of screen height
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/bg_images/Looper BG.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Content
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06), // 6% of screen width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.1), // Spacer proportional to screen height

                        // Logo
                        Image.asset(
                          'assets/images/Group 1171277302.png',
                          width: screenWidth * 0.25, // 25% of screen width
                          height: screenWidth * 0.25, // Maintain aspect ratio
                        ),
                        SizedBox(height: screenHeight * 0.1), // Spacer proportional to screen height

                        // Login Text
                        const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Spacer proportional to screen height

                        // Subtitle Text
                        const Text(
                          'Welcome back! Please enter your details.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.04), // Spacer proportional to screen height

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
                        SizedBox(height: screenHeight * 0.03), // Spacer proportional to screen height

                        // Get OTP Button
                        ElevatedButton(
                          // onPressed: () => loginController.getOtp(context),
                          onPressed: () => loginController.login(context),
                          style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Proportional to screen height
                            backgroundColor: const Color(0xFFDAA520), // Gold color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'SignIn',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  color: Colors.black), // Font size proportional to screen width
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05), // Spacer proportional to screen height

                        // OR Text
                        const Text(
                          'or',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Spacer proportional to screen height

                        // Social Media Login Options
                        const Text(
                          'Login using',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Spacer proportional to screen height

                        // Social Media Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Google Icon
                            IconButton(
                              icon: Image.asset('assets/images/google.png'),
                              iconSize: screenWidth * 0.1, // 10% of screen width
                              onPressed: loginController.signUpWithGoogle,
                            ),
                            SizedBox(width: screenWidth * 0.05), // Spacer proportional to screen width
                            // Facebook Icon
                            IconButton(
                              icon: Image.asset('assets/images/fb.png'),
                              iconSize: screenWidth * 0.1, // 10% of screen width
                              onPressed: loginController.signUpWithFacebook,
                            ),
                            SizedBox(width: screenWidth * 0.05), // Spacer proportional to screen width
                            // Apple Icon
                            IconButton(
                              icon: Image.asset('assets/images/ios.png'),
                              iconSize: screenWidth * 0.1, // 10% of screen width
                              onPressed: loginController.signUpWithApple,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.05), // Spacer proportional to screen height

                        // Footer Text
                        const Text(
                          'Innovation by',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Spacer proportional to screen height
                        const Text(
                          'Ulchemy',
                          style: TextStyle(
                            color: Color(0xFFDAA520), // Gold color
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05), // Spacer proportional to screen height
                      ],
                    ),
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
