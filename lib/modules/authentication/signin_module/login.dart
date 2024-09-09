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
      body: Stack(
        children: [
          // Background Image at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Looper BG.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 270),

                // Logo
                Image.asset(
                  'assets/images/Group 1171277302.png',
                  width: 140,
                  height: 131,
                  color: Colors.white,
                ),
                const SizedBox(height: 80),

                // Log In Button
                ElevatedButton(
                  onPressed: () => loginController.login(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 15),
                    backgroundColor:
                        const Color.fromARGB(255, 218, 165, 32), // Gold color
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
                const SizedBox(height: 20),

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
                const SizedBox(height: 20),

                // Social Media Login Options
                const Text(
                  'or',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sign Up using',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Icon
                    IconButton(
                      icon: Image.asset('assets/images/google.png'),
                      iconSize: 40,
                      onPressed: loginController.signUpWithGoogle,
                    ),
                    const SizedBox(width: 20),
                    // Facebook Icon
                    IconButton(
                      icon: Image.asset('assets/images/fb.png'),
                      iconSize: 40,
                      onPressed: loginController.signUpWithFacebook,
                    ),
                    const SizedBox(width: 20),
                    // Apple Icon
                    IconButton(
                      icon: Image.asset('assets/images/ios.png'),
                      iconSize: 40,
                      onPressed: loginController.signUpWithApple,
                    ),
                  ],
                ),
                const SizedBox(height: 7),

                // Footer Text
                const Text(
                  'Innovation by',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 3),
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
        ],
      ),
    );
  }
}
