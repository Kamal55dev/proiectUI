import 'dart:developer';

import 'package:badminton/modules/authentication/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For DateFormat
import 'package:intl_phone_number_input/intl_phone_number_input.dart'; // For InternationalPhoneNumberInput
import '../signin_module/login.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool isPrivacyAccepted = false;

  @override
  Widget build(BuildContext context) {
    final signupController = ref.watch(signUpControllerProvider.notifier);
    final signupControllerFields = ref.watch(signUpControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bg_images/Looper BG.png', // Background image path
              fit: BoxFit.cover, // Ensures the image covers the top of the screen
              height: MediaQuery.of(context).size.height * 0.4, // Adjust height as needed
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: signupControllerFields.signUpKey, // Add form key for validation
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 100),

                      // Logo
                      Image.asset(
                        'assets/images/Group 1171277302.png',
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 30),

                      // Title and Subtitle
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Welcome to RAK',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Full Name Field
                      TextFormField(
                        controller: signupControllerFields.fullNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Country Field
                      TextFormField(
                        controller: signupControllerFields.addressController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Country',
                          suffixIcon: const Icon(Icons.location_on, color: Colors.white),
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your country';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Email ID Field
                      TextFormField(
                        controller: signupControllerFields.emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Email ID',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: signupControllerFields.phoneNumberController,
                        keyboardType: TextInputType.phone, // Ensure the keyboard is numeric
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Mobile No',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          // Check if the field is empty
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          // Check if the input is numeric and has a length of 10 digits
                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit mobile number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Date of Birth Field
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.dark(
                                    primary: const Color(0xFFDAA520),
                                    onPrimary: Colors.black,
                                    surface: Colors.grey[850]!,
                                    onSurface: Colors.white,
                                  ),
                                  dialogBackgroundColor: Colors.black,
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                            signupControllerFields.dateOfBirthController.text = formattedDate;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                signupControllerFields.dateOfBirthController.text.isEmpty
                                    ? 'Date of Birth'
                                    : signupControllerFields.dateOfBirthController.text,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const Icon(Icons.calendar_today, color: Colors.white70),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Privacy Policy Checkbox
                      Row(
                        children: [
                          Switch(
                            value: signupControllerFields.acceptPrivacyPolicy,
                            onChanged: (value) {
                              signupController.togglePrivacyPolicy(value);
                            },
                            activeTrackColor: const Color(0xff008398),
                            inactiveThumbColor: signupControllerFields.color,
                          ),
                          const Expanded(
                            child: Text(
                              'By continuing you accept our Privacy Policy',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () async {
                          await signupController.signUp(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: const Color(0xFFDAA520),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
