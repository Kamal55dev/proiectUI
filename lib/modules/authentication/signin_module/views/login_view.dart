// // ignore_for_file: library_private_types_in_public_api

// import 'package:badmitton/assets/assets.dart';
// import 'package:badmitton/core/constants/custom_text.dart';
// import 'package:badmitton/core/constants/textsize.dart';
// import 'package:badmitton/core/widgets/common_button_widget.dart';
// import 'package:badmitton/modules/common/auth/views/signup_view.dart';
// import 'package:badmitton/modules/common/auth/controllers/login_controller.dart';
// import 'package:badmitton/modules/routes/common_app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:badmitton/core/widgets/social_media_buttons.dart';
// import 'package:badmitton/core/constants/app_text_styles.dart';
// import 'package:badmitton/core/constants/colors.dart';
// import 'package:badmitton/core/utils/validation_utils.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:neopop/neopop.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final loginFormKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final kheight = MediaQuery.of(context).size.height;
//     final kwidth = MediaQuery.of(context).size.width;
//     final loginController = ref.watch(loginControllerProvider.notifier);
//     final loginContollerFields = ref.watch(loginControllerProvider);

//     return Scaffold(
//       backgroundColor: const Color(0xff16181f),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: kwidth * 0.04, vertical: kheight * 0.05),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: loginFormKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(Assets.of(context).images.companyLogo),
//                   SizedBox(height: kheight * 0.02),
//                   CustomText(
//                     text: 'Login',
//                     color: secondaryColor,
//                     fontSize: getResponsiveFontSize(context, 24),
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(height: kheight * 0.025),
//                   TextFormField(
//                     controller: loginContollerFields.emailController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: TextStyles.inputDecoration(
//                       'Email',
//                       white,
//                       context,
//                       suffixIcon: Icons.email_outlined,
//                     ),
//                     validator: (value) {
//                       return validateEmail(value);
//                     },
//                     onSaved: (value) {},
//                   ),
//                   SizedBox(height: kheight * 0.03),
//                   CustomButton(
//                     text: 'Sign In',
//                     textSize: getResponsiveFontSize(context, 18),
//                     textColor: black,
//                     backgroundColor: secondaryColor,
//                     borderRadius: 12.0,
//                     height: MediaQuery.of(context).size.height * 0.075,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     onPress: () async {
//                       if (loginFormKey.currentState!.validate()) {
//                         loginFormKey.currentState!.save();
//                         loginController.signIn(context, ref);
//                         loginController.reset();
//                       }
//                     },
//                   ),
//                   SizedBox(height: kheight * 0.018),
//                   TextButton(
//                     onPressed: () {
//                       if (loginFormKey.currentState!.validate()) {
//                         loginFormKey.currentState!.save();
//                         Navigator.pushNamed(context, CommonAppRoutes.signUp);
//                       }
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Don't have an account?",
//                           style: TextStyle(
//                             fontSize: getResponsiveFontSize(context, 14),
//                             color: showTextColor,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             loginController.reset();
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpScreen(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             " Sign up",
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontSize: getResponsiveFontSize(context, 14),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: kheight * 0.018),
//                   Text(
//                     'Or connect',
//                     style: TextStyle(
//                       color: showTextColor,
//                       fontSize: getResponsiveFontSize(context, 16),
//                     ),
//                   ),
//                   SizedBox(height: kheight * 0.001),
//                   SocialMediaButtons(
//                     onAppleSignIn: () {
//                       loginController.continueWith(context, "apple");
//                     },
//                     onFacebookSignIn: () {
//                       loginController.continueWith(context, "facebook");
//                     },
//                     onGoogleSignIn: () async {
//                       loginController.continueWith(context, "google");
//                       // await AuthService.login();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AuthService {
//   static final _googleSignIn = GoogleSignIn(
//       // scopes: [
//       //   'email',
//       // ],
//       // clientId: '',
//       );

//   static Future<void> login() async {
//     try {
//       final user = await _googleSignIn.signIn();
//       if (user != null) {
//         debugPrint('Login successful**********');
//       } else {
//         debugPrint('Sign-in aborted by user');
//       }
//     } catch (e) {
//       debugPrint('An error occurred: $e');
//       if (e is PlatformException) {
//         debugPrint('Error message: ${e.message}');
//       }
//     }
//   }

//   static Future<void> logout() async {
//     try {
//       await _googleSignIn.signOut();
//       debugPrint('Logout successful');
//     } catch (e) {
//       debugPrint('An error occurred: $e');
//     }
//   }
// }







// // ignore_for_file: library_private_types_in_public_api

// import 'dart:developer';

// import 'package:badmitton/assets/assets.dart';
// import 'package:badmitton/core/constants/app_text_styles.dart';
// import 'package:badmitton/core/constants/colors.dart';
// import 'package:badmitton/core/constants/constant_size.dart';
// import 'package:badmitton/core/constants/custom_text.dart';
// import 'package:badmitton/core/constants/textsize.dart';
// import 'package:badmitton/core/utils/validation_utils.dart';
// import 'package:badmitton/core/widgets/common_button_widget.dart';
// import 'package:badmitton/core/widgets/common_gradient_button.dart';
// import 'package:badmitton/core/widgets/social_media_buttons.dart';
// import 'package:badmitton/modules/coach/profile/controllers/raqlink_controller.dart';
// import 'package:badmitton/modules/common/auth/controllers/signup_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SignUpScreen extends ConsumerStatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends ConsumerState<SignUpScreen> {
//   late TextEditingController raqLinkCodeController;
//   bool showVerifyButton = false;

//   @override
//   void initState() {
//     super.initState();
//     raqLinkCodeController = TextEditingController();
//     raqLinkCodeController.addListener(() {
//       setState(() {
//         showVerifyButton = raqLinkCodeController.text.isNotEmpty;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     raqLinkCodeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final kheight = MediaQuery.of(context).size.height;
//     final kwidth = MediaQuery.of(context).size.width;

//     final signupController = ref.watch(signUpControllerProvider.notifier);
//     final signupControllerFields = ref.watch(signUpControllerProvider);
//     final raqLinkController = ref.watch(raqLinkControllerProvider);

//     return Scaffold(
//       backgroundColor: const Color(0xff16181f),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: kwidth * 0.033, vertical: kheight * 0.03),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Image.asset(Assets.of(context).images.companyLogo),
//             ),
//             SizedBox(height: kheight * 0.03),
//             const Text(
//               'Sign up now',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             SizedBox(height: kheight * 0.03),
//             Form(
//               key: signupControllerFields.signUpKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextFormField(
//                     controller: signupControllerFields.fullNameController,
//                     style: const TextStyle(color: white),
//                     decoration: TextStyles.inputDecoration('Full Name', white, context),
//                     validator: (value) {
//                       return validateName(value);
//                     },
//                     onSaved: (value) {},
//                   ),
//                   SizedBox(height: kheight * 0.018),
//                   TextFormField(
//                     controller: signupControllerFields.emailController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: TextStyles.inputDecoration('Email', white, context),
//                     validator: (value) {
//                       return validateEmail(value);
//                     },
//                     onSaved: (value) {},
//                   ),
//                   SizedBox(height: kheight * 0.018),
//                   TextFormField(
//                     controller: signupControllerFields.phoneNumberController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: TextStyles.inputDecoration(
//                       'Phone Number',
//                       white,
//                       context,
//                     ),
//                     validator: (value) {
//                       return validatePhone(value);
//                     },
//                     onSaved: (value) {},
//                   ),
//                   SizedBox(height: kheight * 0.018),
//                   CustomText(
//                     text: 'Select Role',
//                     fontSize: kheight * 0.024,
//                     color: white,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   SizedBox(
//                     height: kheight * 0.02,
//                   ),
//                   Row(
//                     mainAxisAlignment:
//                         signupControllerFields.rolesLoading ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
//                     children: signupControllerFields.rolesLoading
//                         ? [
//                             Image.asset(
//                               Assets.of(context).images.loader,
//                               height: kheight * 0.1,
//                               width: kwidth * 0.1,
//                               fit: BoxFit.cover,
//                             ),
//                           ]
//                         : (signupControllerFields.roles
//                             .map(
//                               (role) => CustomButton(
//                                 onPress: () {
//                                   signupController.selectRole(role);
//                                 },
//                                 height: kheight * 0.062,
//                                 width: kwidth * 0.44,
//                                 borderRadius: 15.0,
//                                 text: role.role,
//                                 textSize: 18,
//                                 borderColor: signupControllerFields.roleError ? Colors.red : primaryColor,
//                                 textColor: white,
//                                 backgroundColor:
//                                     signupControllerFields.selectedRole == role.id ? primaryColor : backgroundColor,
//                               ),
//                             )
//                             .toList()),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: kheight * 0.02,
//             ),
//             Form(
//               key: raqLinkController.raqKey,
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: kheight * 0.095,
//                     width: kwidth * 0.6,
//                     child: TextFormField(
//                       controller: raqLinkCodeController,
//                       maxLength: 9,
//                       style: const TextStyle(color: white, fontWeight: FontWeight.w500),
//                       decoration: TextStyles.inputDecoration(
//                         'RAQ Verification Code',
//                         white,
//                         context,
//                       ),
//                     ),
//                   ),
//                   kWidth(context, 0.14),
//                   InkWell(
//                     onTap: () {
//                       log(raqLinkCodeController.toString());

//                       if (showVerifyButton) {
//                         if (raqLinkController.raqKey.currentState!.validate()) {
//                           raqLinkController.raqlinkSubmit(context, raqLinkCodeController.text.toString());
//                           log(raqLinkCodeController.toString());
//                         }
//                       } else {
//                         raqLinkCodeController.clear();
//                         raqLinkController.skipAction(context);
//                       }
//                     },
//                     child: CustomText(
//                       text: showVerifyButton ? 'Verify' : 'Skip',
//                       color: showVerifyButton ? Colors.blue : Colors.red,
//                       fontSize: getResponsiveFontSize(context, 18),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(children: [
//               Transform.scale(
//                 scale: 0.6, // Set the scale factor to reduce the size
//                 child: Switch(
//                   value: signupControllerFields.acceptPrivacyPolicy,
//                   onChanged: (value) {
//                     signupController.togglePrivacyPolicy(value);
//                   },
//                   activeTrackColor: const Color(0xff008398),
//                   inactiveThumbColor: signupControllerFields.color,
//                 ),
//               ),
//               const Expanded(
//                 child: Text(
//                   'By continuing you accept our Privacy Policy',
//                   style: TextStyle(color: grey),
//                 ),
//               ),
//             ]),
//             SizedBox(height: kheight * 0.001),
//             CutomGradientButton(
//               text: 'Sign Up',
//               textSize: 18,
//               textColor: white,
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF55E9C9), Color(0xFF308371)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: 12.0,
//               height: MediaQuery.of(context).size.height * 0.075,
//               width: MediaQuery.of(context).size.width * 0.9,
//               onPress: () async {
//                 await signupController.signUp(context);
//                 // signupController.reset();
//               },
//             ),
//             SizedBox(height: kheight * 0.001),
//             TextButton(
//               onPressed: () {
//                 // Handle sign up
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Already have an account ",
//                       style: TextStyle(
//                         color: ColorPalette.shaowTextColor,
//                       )),
//                   GestureDetector(
//                     onTap: () {
//                       signupController.reset();
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       "Login",
//                       style: TextStyle(color: ColorPalette.primaryColor),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: kheight * 0.001),
//             const Center(
//               child: Text(
//                 'Or Connect',
//                 style: TextStyle(color: ColorPalette.shaowTextColor, fontSize: 15),
//               ),
//             ),
//             SizedBox(height: kheight * 0.001),
//             SocialMediaButtons(
//               onAppleSignIn: () {
//                 // Handle Apple sign-in
//               },
//               onFacebookSignIn: () {
//                 // Handle Facebook sign-in
//               },
//               onGoogleSignIn: () {
//                 // Handle Google sign-in
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
