// // ignore_for_file: use_build_context_synchronously, duplicate_ignore

// import 'dart:developer';

// import 'package:badminton/common/message_view.dart';
// import 'package:badminton/core/models/authentication/login_user_model.dart';
// import 'package:badminton/core/utils/data_storage.dart';
// import 'package:badminton/modules/authentication/controllers/profile_controller.dart';
// import 'package:badminton/modules/authentication/controllers/loader.dart';
// import 'package:badminton/modules/authentication/controllers/player_controller.dart';
// import 'package:badminton/services/auth_service/auth_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
//   final state = LoginState(
//     emailController: TextEditingController(),
//     // loginFormKey: GlobalKey<FormState>(),
//   );
//   ref.onDispose(state.dispose);
//   return LoginController(state, ref.read(loaderProvider), ref.read(messageProvider), ref.read(dataStorageProvider));
// });

// class LoginController extends StateNotifier<LoginState> {
//   final LoaderScreenController _loaderProvider;
//   final MessageHandler _errorMessageHandler;
//   final DataStorage _dataStorage;

//   LoginController(super.state, this._loaderProvider, this._errorMessageHandler, this._dataStorage);

//   void toggleVisibility() {
//     state = state.copyWith(obscureText: !state.obscureText);
//   }

//   void forgetPassword(BuildContext context) {
//     // debugPrint("Forget password clicked");
//   }

//   void continueWith(BuildContext context, String key) {
//     // debugPrint("ContinueWith:::$key");
//   }

//   void signIn(BuildContext context, WidgetRef ref) async {
//     final String email = state.emailController.text;
//     final authService = ref.read(authServiceProvider);

//     _loaderProvider.setLoader(true);
//     try {
//       Response response = await authService.login(context, email);
//       if (response.statusCode == 200) {
//         _loaderProvider.setLoader(false);
//         final loginResponse = LoginResponse.fromJson(response.data);

//         final imageUrl = loginResponse.user.displayImage ?? "";

//         if (imageUrl.isNotEmpty) {
//           final profileController = ref.read(profileControllerProvider.notifier);
//           profileController.updateProfileImage(imageUrl);
//         }
//         if (imageUrl.isNotEmpty) {
//           final profileController = ref.read(coachprofileControllerProvider.notifier);
//           profileController.updateProfileImage(imageUrl);
//         }

//         await _dataStorage.storeLoginResponse(loginResponse);

//         final LoginResponse? obj = await _dataStorage.getLoginResponse();
//         if (obj != null) {
//           if (obj.user.roleName == 'Player') {
//             log(obj.user.roleName.toString());
//             // Navigator.pushNamed(context, CommonAppRoutes.playerhome);
//           } else {
//             if (obj.user.isOrientationTeam == 1) {
//               // Navigator.pushNamed(context, CommonAppRoutes.orehome);
//             } else {
//               // Navigator.pushNamed(context, CommonAppRoutes.home);
//             }
//           }
//         } else {
//           _errorMessageHandler.showErrorMessage(
//               context, response.statusCode!, 'Unexpected error, please try again later.');
//         }
//       }
//     } on DioException catch (e) {
//       _loaderProvider.setLoader(false);
//       int statusCode = e.response?.statusCode ?? 500;
//       String message = statusCode == 401 ? 'Invalid username' : 'Internal server error';
//       _errorMessageHandler.showErrorMessage(context, statusCode, message);
//     } catch (error) {
//       _loaderProvider.setLoader(false);
//       _errorMessageHandler.showErrorMessage(context, 500, 'An unexpected error occurred. Please try again later.');
//     }
//   }

//   void signOut(BuildContext context, WidgetRef ref) async {
//     _loaderProvider.setLoader(true);

//     try {
//       // Clear the stored login data
//       await _dataStorage.clearLoginResponse();

//       _loaderProvider.setLoader(false);

//       // Navigate to login screen
//       // Navigator.pushNamedAndRemoveUntil(context, CommonAppRoutes.initial, (route) => false);
//     } catch (error) {
//       _loaderProvider.setLoader(false);
//       _errorMessageHandler.showErrorMessage(context, 500, 'An unexpected error occurred. Please try again later.');
//     }
//   }

//   void reset() {
//     state.emailController.clear();
//   }

//   @override
//   void dispose() {
//     state.emailController.dispose();
//     super.dispose();
//   }
// }

// @immutable
// class LoginState {
//   final TextEditingController emailController;
//   final bool obscureText;

//   const LoginState({
//     required this.emailController,
//     this.obscureText = true,
//   });

//   LoginState copyWith({
//     TextEditingController? emailController,
//     bool? obscureText,
//   }) {
//     return LoginState(
//       emailController: emailController ?? this.emailController,
//       // loginFormKey: loginFormKey ?? this.loginFormKey,
//       obscureText: obscureText ?? this.obscureText,
//     );
//   }

//   void dispose() {
//     emailController.dispose();
//   }
// }
