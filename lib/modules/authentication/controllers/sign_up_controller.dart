// // ignore_for_file: use_build_context_synchronously, unused_field

// import 'dart:developer';
// import 'package:badminton/common/message_view.dart';
// import 'package:badminton/core/models/authentication/roles.dart';
// import 'package:badminton/core/models/authentication/sign_up_model.dart';
// import 'package:badminton/core/utils/data_storage.dart';
// import 'package:badminton/modules/authentication/controllers/loader.dart';
// import 'package:badminton/modules/authentication/controllers/raq_controller.dart';
// import 'package:badminton/services/auth_service/auth_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final signUpControllerProvider = StateNotifierProvider<SignUpController, SignUpState>((ref) {
//   final state = SignUpState(
//       fullNameController: TextEditingController(),
//       emailController: TextEditingController(),
//       phoneNumberController: TextEditingController(),
//       signUpKey: GlobalKey<FormState>(debugLabel: 'signUpKey'),
//       color: Colors.white,
//       roleError: false,
//       raqLinkCode: TextEditingController(),
//       roles: [],
//       rolesLoading: false);
//   ref.onDispose(state.dispose);
//   return SignUpController(state, ref.read(loaderProvider), ref.read(authServiceProvider), ref.read(messageProvider),
//       ref.read(dataStorageProvider));
// });

// class SignUpController extends StateNotifier<SignUpState> {
//   final LoaderScreenController _loaderProvider;
//   final AuthService _authService;
//   final MessageHandler _messageHandler;
//   final DataStorage _dataStorage;

//   SignUpController(super.state, this._loaderProvider, this._authService, this._messageHandler, this._dataStorage) {
//     state.raqLinkCode.addListener(_onRaqLinkCodeChanged);
//     _getSignupRoles();
//   }

//   void toggleVisibility() {
//     state = state.copyWith(obscureText: !state.obscureText);
//   }

//   void login(BuildContext context) {
//     // Navigator.pushNamed(context, CommonAppRoutes.initial);
//   }

//   void togglePrivacyPolicy(bool value) {
//     state = state.copyWith(acceptPrivacyPolicy: value);
//   }

//   Future<Academy?> getAcademy() async {
//     final Academy? academy = await DataStorage().getAcademy();
//     if (academy != null) {
//       state.copyWith(
//         academyId: academy.id,
//         isOrientationTeam: academy.isOrientationTeam,
//       );
//     }
//     return null;
//   }

//   Future<void> signUp(BuildContext context) async {
//     checkValidations();
//     if (state.signUpKey.currentState!.validate()) {
//       if (!checkValidations()) {
//         return;
//       }
//       state.signUpKey.currentState!.save();
//       await getAcademy();
//       try {
//         final Academy? academy = await DataStorage().getAcademy();

//         Response response = await _authService.register(state.toSignUpModel(academy!.id, academy.isOrientationTeam));
//         _loaderProvider.setLoader(false);

//         if (response.statusCode == 201) {
//           _messageHandler.showErrorMessage(context, response.statusCode!, 'Sign Up Successful');
//           // Navigator.pushNamed(context, CommonAppRoutes.initial);
//         } else {
//           _messageHandler.showErrorMessage(context, response.statusCode!, 'Unexpected error, please try again later.');
//         }
//       } on DioException catch (e) {
//         int statusCode = e.response?.statusCode ?? 500;
//         if (statusCode == 409) {
//           _messageHandler.showErrorMessage(context, 409, "Email Id is already registered");
//         } else {
//           _messageHandler.showErrorMessage(
//               context, statusCode, "An unexpected error occurred. Please try again later.s");
//         }
//       } catch (error) {
//         log(error.toString());
//         _messageHandler.showErrorMessage(context, 500, 'An unexpected error occurred. Please try again later.ss');
//       }
//     }
//   }

//   bool checkValidations() {
//     if (state.selectedRole == 0) {
//       state = state.copyWith(roleError: true);
//       return false;
//     }

//     if (!state.acceptPrivacyPolicy) {
//       state = state.copyWith(color: Colors.red);
//       return false;
//     }

//     return true;
//   }

//   // void signUp(BuildContext context) {
//   //   print("privacy::::::" + state.acceptPrivacyPolicy.toString());

//   //   checkValidations();
//   //   if (state.signUpformKey.currentState!.validate()) {
//   //     if (!checkValidations()) {
//   //       return;
//   //     }
//   //     state.signUpformKey.currentState!.save();
//   //     _loaderProvider.simulateDemoIsLoaderDelay();

//   //     Navigator.pushNamed(context, CommonAppRoutes.initial);
//   //     log("sign up success");
//   //   }
//   // }

//   // bool checkValidations(){

//   //   if (state.selectedRole.isEmpty) {
//   //       state = state.copyWith(roleError: true);
//   //       return false;
//   //   }

//   //   if (!state.acceptPrivacyPolicy) {
//   //     state = state.copyWith(color: Colors.red);
//   //     return false;
//   //   }

//   //   return true;
//   // }

//   void reset() {
//     state.fullNameController.clear();
//     state.emailController.clear();
//     state.phoneNumberController.clear();
//     state.raqLinkCode.clear();
//     state = state.copyWith(color: Colors.white);
//   }

//   void selectRole(Role role) {
//     state = state.copyWith(selectedRole: role.id);
//     state = state.copyWith(roleError: false);
//   }

//   void _onRaqLinkCodeChanged() {
//     if (state.raqLinkCode.text.length == 10) {
//       state = state.copyWith(isLoading: true);
//     }
//   }

//   _getSignupRoles() async {
//     state = state.copyWith(rolesLoading: true);
//     Response response = await _authService.getRoles();
//     if (response.statusCode != 200) {
//       state = state.copyWith(rolesLoading: false);
//       _messageHandler.showErrorMessage(
//           state.signUpKey.currentContext!, response.statusCode!, 'Unexpected error, please try again later.');
//       return;
//     } else if (response.statusCode == 500) {
//       _messageHandler.showErrorMessage(
//           state.signUpKey.currentContext!, response.statusCode!, 'Please contact administrators.');
//     }
//     List<Role> roles = (response.data as List).map((item) => Role.fromJson(item)).toList();
//     state = state.copyWith(roles: roles);
//     state = state.copyWith(rolesLoading: false);
//   }

//   @override
//   void dispose() {
//     state.raqLinkCode.removeListener(_onRaqLinkCodeChanged);
//     state.emailController.dispose();
//     state.fullNameController.dispose();
//     state.phoneNumberController.dispose();
//     super.dispose();
//   }
// }

// class SignUpState {
//   final TextEditingController fullNameController;
//   final TextEditingController emailController;
//   final TextEditingController phoneNumberController;
//   final GlobalKey<FormState> signUpKey;
//   final bool obscureText;
//   final bool acceptPrivacyPolicy;
//   final Color color;
//   final int selectedRole;
//   final bool roleError;
//   final TextEditingController raqLinkCode;
//   final bool isLoading;
//   final List<Role> roles;
//   final bool rolesLoading;
//   final int? academyId;
//   final int? isOrientationTeam;

//   SignUpState(
//       {required this.fullNameController,
//       required this.emailController,
//       required this.phoneNumberController,
//       required this.signUpKey,
//       this.obscureText = true,
//       this.acceptPrivacyPolicy = false,
//       required this.color,
//       this.selectedRole = 0,
//       this.roleError = false,
//       required this.raqLinkCode,
//       this.isLoading = false,
//       this.academyId,
//       this.isOrientationTeam,
//       required this.roles,
//       required this.rolesLoading});

//   SignUpState copyWith(
//       {TextEditingController? fullNameController,
//       TextEditingController? emailController,
//       TextEditingController? phoneNumberController,
//       GlobalKey<FormState>? signUpKey,
//       bool? obscureText,
//       bool? acceptPrivacyPolicy,
//       Color? color,
//       int? selectedRole,
//       bool? roleError,
//       TextEditingController? raqLinkCode,
//       bool? isLoading,
//       List<Role>? roles,
//       int? academyId,
//       int? isOrientationTeam,
//       bool? rolesLoading}) {
//     return SignUpState(
//       fullNameController: fullNameController ?? this.fullNameController,
//       emailController: emailController ?? this.emailController,
//       phoneNumberController: phoneNumberController ?? this.phoneNumberController,
//       signUpKey: signUpKey ?? this.signUpKey,
//       obscureText: obscureText ?? this.obscureText,
//       acceptPrivacyPolicy: acceptPrivacyPolicy ?? this.acceptPrivacyPolicy,
//       color: color ?? this.color,
//       selectedRole: selectedRole ?? this.selectedRole,
//       roleError: roleError ?? this.roleError,
//       raqLinkCode: raqLinkCode ?? this.raqLinkCode,
//       isLoading: isLoading ?? this.isLoading,
//       roles: roles ?? this.roles,
//       rolesLoading: rolesLoading ?? this.rolesLoading,
//       academyId: academyId ?? this.academyId,
//       isOrientationTeam: isOrientationTeam ?? this.isOrientationTeam,
//     );
//   }

//   void dispose() {
//     fullNameController.dispose();
//     emailController.dispose();
//     phoneNumberController.dispose();
//   }

//   SignUpModel toSignUpModel(int? academyId, int? isOrientationTeam) {
//     return SignUpModel(
//       name: fullNameController.text,
//       email: emailController.text,
//       mobileNumber: phoneNumberController.text,
//       academyId: academyId ?? 0,
//       isOrientationTeam: isOrientationTeam ?? 0,
//       role: selectedRole,
//     );
//   }
// }
