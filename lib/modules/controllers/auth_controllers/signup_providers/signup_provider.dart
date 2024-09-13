// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final signupFormProvider =
//     ChangeNotifierProvider((_) => SignupFormController());

// class SignupFormController extends ChangeNotifier {
//   // Define TextEditingController for each input field
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mobileNumberController = TextEditingController();
//   final TextEditingController dateOfBirthController = TextEditingController();

//   // Getter methods for accessing the text directly
//   String get fullName => fullNameController.text;
//   String get country => countryController.text;
//   String get email => emailController.text;
//   String get mobileNumber => mobileNumberController.text;
//   String get dateOfBirth => dateOfBirthController.text;

//   // Update methods, if needed, to trigger additional logic or validation
//   void updateFullName(String value) {
//     fullNameController.text = value;
//     notifyListeners();
//   }

//   void updateCountry(String value) {
//     countryController.text = value;
//     notifyListeners();
//   }

//   void updateEmail(String value) {
//     emailController.text = value;
//     notifyListeners();
//   }

//   void updateMobileNumber(String value) {
//     mobileNumberController.text = value;
//     notifyListeners();
//   }

//   void updateDateOfBirth(String value) {
//     dateOfBirthController.text = value;
//     notifyListeners();
//   }

//   // Dispose all controllers when not needed to free up resources
//   @override
//   void dispose() {
//     fullNameController.dispose();
//     countryController.dispose();
//     emailController.dispose();
//     mobileNumberController.dispose();
//     dateOfBirthController.dispose();
//     super.dispose();
//   }
// }
