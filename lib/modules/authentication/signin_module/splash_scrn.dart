import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth_controllers/signin_providers/splash_provider.dart';
import 'login.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start initialization process
    ref.read(splashScreenControllerProvider).init().then((_) {
      //Navigate to home screen or appropriate screen
      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_images/Looper Bg image.png', // Replace with your background image asset path
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content (logo and text)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/Group 1171277302.png',
                  // color: Colors.black,
                  width: 140,
                  height: 132,
                ),
                // const Spacer(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Innovation by',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Poppins'),
                ),
                const Text(
                  'Ulchemy',
                  style: TextStyle(
                      color: Color(0xFFFFD700), // Gold color for "Ulchemy"
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
