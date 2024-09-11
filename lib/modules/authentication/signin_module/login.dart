import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth_controllers/signin_providers/login_provider.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              // Background Image at the top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/bg_images/Looper BG.png',
                  fit: BoxFit.cover,
                  height: screenHeight * 0.4, // 40% of screen height
                  width: screenWidth,
                ),
              ),
              // Foreground Content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: screenHeight *
                            0.25), // Spacer proportional to screen height

                    // Logo
                    Image.asset(
                      'assets/images/Group 1171277302.png',
                      width: screenWidth * 0.35, // 35% of screen width
                      height: screenWidth * 0.35, // Maintain aspect ratio
                      color: Colors.white,
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.1), // Spacer proportional to screen height

                    // Log In Button
                    ElevatedButton(
                      onPressed: () => loginController.login(context),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.3,
                            vertical: 15), // 30% of screen width
                        backgroundColor: const Color.fromARGB(
                            255, 218, 165, 32), // Gold color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.02), // Spacer proportional to screen height

                    // Create Account Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New User ? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () =>
                              loginController.navigateToCreateAccount(context),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color(0xFFDAA520), // Gold color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.02), // Spacer proportional to screen height

                    // Social Media Login Options
                    const Text(
                      'or',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.01), // Spacer proportional to screen height
                    const Text(
                      'Sign Up using',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.03), // Spacer proportional to screen height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google Icon
                        IconButton(
                          icon: Image.asset('assets/images/google.png'),
                          iconSize: screenWidth * 0.1, // 10% of screen width
                          onPressed: loginController.signUpWithGoogle,
                        ),
                        SizedBox(
                            width: screenWidth *
                                0.05), // Spacer proportional to screen width
                        // Facebook Icon
                        IconButton(
                          icon: Image.asset('assets/images/fb.png'),
                          iconSize: screenWidth * 0.1, // 10% of screen width
                          onPressed: loginController.signUpWithFacebook,
                        ),
                        SizedBox(
                            width: screenWidth *
                                0.05), // Spacer proportional to screen width
                        // Apple Icon
                        IconButton(
                          icon: Image.asset('assets/images/ios.png'),
                          iconSize: screenWidth * 0.1, // 10% of screen width
                          onPressed: loginController.signUpWithApple,
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.02), // Spacer proportional to screen height

                    // Footer Text
                    const Text(
                      'Innovation by',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.01), // Spacer proportional to screen height
                    const Text(
                      'Ulchemy',
                      style: TextStyle(
                        color: Color(0xFFDAA520), // Gold color
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.05), // Spacer proportional to screen height
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
