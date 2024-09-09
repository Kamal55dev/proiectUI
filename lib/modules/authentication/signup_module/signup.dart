// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../../provider/signup/signup_provider.dart';

// class Signup extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final signupController = ref.watch(signupFormProvider);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/Looper BG.png', // Replace with your background image asset
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Content
//           SingleChildScrollView(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const SizedBox(height: 100), // Adjust based on the UI

//                     // Logo
//                     Image.asset(
//                       'assets/Group 1171277302.png', // Replace with your logo asset
//                       width: 80,
//                       height: 80,
//                     ),
//                     const SizedBox(height: 30),

//                     // Title and Subtitle
//                     const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'Welcome to RAK',
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 30),

//                     // Full Name Field
//                     TextField(
//                       onChanged: (value) =>
//                           signupController.updateFullName(value),
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: 'Full Name',
//                         hintStyle: const TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.grey[850],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Country Field
//                     TextField(
//                       onChanged: (value) =>
//                           signupController.updateCountry(value),
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: 'Country',
//                         suffixIcon:
//                             Icon(Icons.location_on, color: Colors.white),
//                         hintStyle: const TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.grey[850],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Email ID Field
//                     TextField(
//                       onChanged: (value) => signupController.updateEmail(value),
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: 'Email ID',
//                         hintStyle: const TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.grey[850],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Mobile Number Field
//                     TextField(
//                       onChanged: (value) =>
//                           signupController.updateMobileNumber(value),
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: 'Mobile Number',
//                         hintStyle: const TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.grey[850],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Date of Birth Field
//                     GestureDetector(
//                       onTap: () async {
//                         DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1900),
//                           lastDate: DateTime(2100),
//                           builder: (context, child) {
//                             return Theme(
//                               data: Theme.of(context).copyWith(
//                                 colorScheme: ColorScheme.dark(
//                                   primary:
//                                       const Color(0xFFDAA520), // Gold color
//                                   onPrimary: Colors.black,
//                                   surface: Colors.grey[850]!,
//                                   onSurface: Colors.white,
//                                 ),
//                                 dialogBackgroundColor: Colors.black,
//                               ),
//                               child: child!,
//                             );
//                           },
//                         );

//                         if (pickedDate != null) {
//                           String formattedDate =
//                               DateFormat('yyyy-MM-dd').format(pickedDate);
//                           signupController.updateDateOfBirth(formattedDate);
//                         }
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[850],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               signupController.dateOfBirth ?? 'Date of Birth',
//                               style: const TextStyle(color: Colors.white70),
//                             ),
//                             const Icon(Icons.calendar_today,
//                                 color: Colors.white70),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Privacy Policy Checkbox
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: true, // Manage the state as required
//                           onChanged: (value) {
//                             // Handle the checkbox state change
//                           },
//                           activeColor: const Color(0xFFDAA520), // Gold color
//                           checkColor: Colors.black,
//                         ),
//                         const Expanded(
//                           child: Text(
//                             'By continuing you accept our Privacy Policy',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),

//                     // Submit Button
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle the submit logic
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         backgroundColor: Color(0xFFDAA520),
//                         shape: RoundedRectangleBorder(
//                           side: const BorderSide(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Submit',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Login Text
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Already a member ?',
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Handle navigation to login page
//                           },
//                           child: const Text(
//                             'Go to Login',
//                             style: TextStyle(color: Color(0xFFDAA520)),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),

//                     // Footer Section
//                     const Text(
//                       'Innovation by',
//                       style: TextStyle(color: Colors.white70, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                     const Text(
//                       'Ulchemy',
//                       style: TextStyle(
//                         color: Color(0xFFDAA520), // Gold color
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For DateFormat
import 'package:intl_phone_number_input/intl_phone_number_input.dart'; // For InternationalPhoneNumberInput

import '../../controllers/auth_controllers/signup_providers/signup_provider.dart';
import '../signin_module/login.dart';
import 'otp.dart'; // Ensure that the OTP screen is defined in your project

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(signupFormProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Looper BG.png',
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
                    TextField(
                      onChanged: (value) => signupController.updateFullName(value),
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
                    ),
                    const SizedBox(height: 20),

                    // Country Field
                    TextField(
                      onChanged: (value) => signupController.updateCountry(value),
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
                    ),
                    const SizedBox(height: 20),

                    // Email ID Field
                    TextField(
                      onChanged: (value) => signupController.updateEmail(value),
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
                    ),
                    const SizedBox(height: 20),

                    // Mobile Number Field with Country Code Dropdown
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          signupController.updateMobileNumber(number.phoneNumber ?? '');
                        },
                        initialValue: PhoneNumber(isoCode: 'US'),
                        formatInput: true,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                          showFlags: true,
                          useEmoji: true,
                        ),
                        textFieldController: signupController.mobileNumberController,
                        inputDecoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        onSaved: (PhoneNumber number) {},
                      ),
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
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          signupController.updateDateOfBirth(formattedDate);
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
                              signupController.dateOfBirth.isEmpty ? 'Date of Birth' : signupController.dateOfBirth,
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
                        Checkbox(
                          value: true, // Manage the state as required
                          onChanged: (value) {
                            // Handle the checkbox state change
                          },
                          activeColor: const Color(0xFFDAA520),
                          checkColor: Colors.black,
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

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the OTP screen using Navigator.push
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtpScreen(),
                          ),
                        );
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

                    // Login Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a member ?',
                          style: TextStyle(color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                          },
                          child: const Text(
                            'Go to Login',
                            style: TextStyle(color: Color(0xFFDAA520)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Innovation by',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Ulchemy',
                      style: TextStyle(
                        color: Color(0xFFDAA520),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
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
