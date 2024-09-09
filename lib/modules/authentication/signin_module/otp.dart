import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async'; // For Timer
import '../../controllers/auth_controllers/signup_providers/otp_provider.dart';
import 'login.dart';

class Otp extends ConsumerStatefulWidget {
  const Otp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtpState createState() => _OtpState();
}

class _OtpState extends ConsumerState<Otp> {
  late Timer _timer;
  int _seconds = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otp = ref.watch(otpProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Looper BG.png', // Replace with your background image asset
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                        height: 60), // Space for the background to show

                    // Logo
                    Image.asset(
                      'assets/images/Group 1171277302.png', // Replace with your logo asset
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 30),

                    // Title
                    const Text(
                      'Verify OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Subtitle
                    const Text(
                      'Enter the OTP received in your mobile number or email ID',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 30),

                    // OTP Input Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(4, (index) => _otpBox(ref, index, otp)),
                    ),
                    const SizedBox(height: 50),

                    // Verify Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle OTP verification
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFFDAA520), // Gold color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Countdown Timer for Resend OTP
                    Text(
                      _seconds > 0 ? '$_seconds sec Resend OTP' : 'Resend OTP',
                      style: TextStyle(
                        color: _seconds == 0 ? Colors.blue : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Go Back to Login Section
                    Row(
                      children: [
                        const SizedBox(width: 85),
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                          },
                          child: const Text(
                            'Go back to Login',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),

                    // Footer Section
                    const SizedBox(height: 120),
                    const Text(
                      'Innovation by',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Ulchemy',
                      style: TextStyle(
                        color: Color(0xFFDAA520), // Gold color
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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

  Widget _otpBox(WidgetRef ref, int index, String otp) {
    return Container(
      width: 40,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: TextField(
        onChanged: (value) {
          // Update the OTP in provider
          if (value.length == 1) {
            ref.read(otpProvider.notifier).state =
                ref.read(otpProvider.notifier).state + value;
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
