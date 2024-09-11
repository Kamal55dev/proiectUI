// // ignore_for_file: use_build_context_synchronously

// import 'dart:developer';

// import 'package:badminton/common/message_view.dart';
// import 'package:badminton/core/models/authentication/login_user_model.dart';
// import 'package:badminton/core/utils/data_storage.dart';
// import 'package:badminton/modules/authentication/controllers/loader.dart';
// import 'package:badminton/services/auth_service/auth_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final raqLinkControllerProvider = ChangeNotifierProvider((ref) => RaqLinkController(ref));

// class RaqLinkController extends ChangeNotifier {
//   final raqcodeController = TextEditingController();
//   final raqKey = GlobalKey<FormState>();
//   final AuthService _authService;
//   final LoaderScreenController _loaderProvider;
//   final MessageHandler _messageHandler;
//   bool _isLoader = false;

//   // RaqLinkController(Ref ref) : _loaderProvider = ref.read(loaderProvider) {
//   //   raqcodeController = TextEditingController();
//   // }
//   RaqLinkController(Ref ref)
//       : _authService = ref.read(authServiceProvider),
//         _messageHandler = ref.read(messageProvider),
//         _loaderProvider = ref.read(loaderProvider),
//         super();

//   bool get isLoader => _isLoader;

//   void _setLoader(bool value) {
//     _isLoader = value;
//     notifyListeners();
//   }

//   void simulateDemoIsLoaderDelay() {
//     _setLoader(true);
//     Future.delayed(const Duration(seconds: 3), () {
//       _setLoader(false);
//     });
//   }

//   @override
//   void dispose() {
//     raqcodeController.dispose();
//     super.dispose();
//   }

//   void raqlinkSubmit(BuildContext context, String raqCode) async {
//     if (raqKey.currentState!.validate()) {
//       try {
//         log(raqCode);
//         final response = await _authService.raqLinkVerify(raqCode);
//         // log('hello started');

//         _loaderProvider.simulateDemoIsLoaderDelay();
//         if (response.statusCode == 200) {
//           final Academy academy = Academy(
//               id: response.data['academy']['id'], isOrientationTeam: response.data['academy']['isOrientationTeam']);

//           await DataStorage().storeAcademy(academy);
//           // log(academy.toString());
//           _messageHandler.showErrorMessage(context, response.statusCode ?? 200, "raq code verified");
//         } else {
//           // log('${response.statusCode}');
//           // if (response.statusCode == 404) {
//           //   _messageHandler.showErrorMessage(
//           //       context, response.statusCode ?? 404, 'RAQ Code ${response.statusCode} is not available.');
//           // } else {
//           //   _messageHandler.showErrorMessage(
//           //       context, response.statusCode ?? 500, 'Failed to verify: ${response.statusCode}');
//           // }
//         }
//       } catch (error) {
//         // ignore: deprecated_member_use
//         if (error is DioError) {
//           if (error.response?.statusCode == 404) {
//             _messageHandler.showErrorMessage(
//                 context, error.response?.statusCode ?? 404, 'RAQ Code $raqCode is not available.');
//           } else {
//             final errorMessage = error.response?.data['message'] ?? 'Unknown error';
//             _messageHandler.showErrorMessage(
//                 context, error.response?.statusCode ?? 500, 'Failed to verify raq code: $errorMessage');
//           }
//         } else {
//           _messageHandler.showErrorMessage(context, 500, 'raq code verify failed');
//         }
//       }
//     }
//   }

//   void skipAction(BuildContext context) async {
//     final Academy academy = Academy(
//       id: 0,
//       isOrientationTeam: 0,
//     );

//     await DataStorage().storeAcademy(academy);
//   }

//   void raqlinkSubmitByUser(BuildContext context, String raqCode) async {
//     if (raqKey.currentState!.validate()) {
//       try {
//         final response = await _authService.raqLinkVerify(raqCode);
//         // log('hello started');

//         // _loaderProvider.simulateDemoIsLoaderDelay();
//         if (response.statusCode == 200) {
//           final DataStorage dataStorage = DataStorage();
//           LoginResponse? loginResponse = await dataStorage.getLoginResponse();

//           final RAQVerification model = RAQVerification(
//             userId: loginResponse!.user.id,
//             role: loginResponse.user.role,
//             associateId: loginResponse.user.academyId,
//             academyId: response.data['academy']['id'],
//             isOrientationTeam: response.data['academy']['isOrientationTeam'],
//           );
//           // log(model.academyId.toString());
//           await _authService.raqLinkVerifyUser(model);

//           _messageHandler.showErrorMessage(context, response.statusCode ?? 200, "raq code verified");
//           // Navigator.of(context).push(MaterialPageRoute(
//           //   builder: (context) => const RaqSucessScreen(),
//           // ));
//           // Future.delayed(const Duration(milliseconds: 500), () {
//           //   Navigator.of(context).push(
//           //     MaterialPageRoute(
//           //       builder: (context) => const AccountVerificationScreen(),
//           //     ),
//           //   );
//           // });
//         } else {
//           // Handle other status codes
//           // _messageHandler.showErrorMessage(
//           //     context, response.statusCode ?? 500, 'Failed to verify: ${response.statusCode}');
//         }
//       } catch (error) {
//         // Handle DioError or other exceptions
//         // ignore: deprecated_member_use
//         if (error is DioError) {
//           if (error.response?.statusCode == 404) {
//             _messageHandler.showErrorMessage(
//                 context, error.response?.statusCode ?? 404, 'RAQ Code $raqCode is not available.');
//           } else {
//             final errorMessage = error.response?.data['message'] ?? 'Unknown error';
//             _messageHandler.showErrorMessage(
//                 context, error.response?.statusCode ?? 500, 'Failed to verify raq code: $errorMessage');
//           }
//         } else {
//           _messageHandler.showErrorMessage(context, 500, 'raq code verify failed');
//         }
//       }
//     }
//   }

//   void raqlinkPlayerSubmit(BuildContext context, String raqCode) async {
//     if (raqKey.currentState!.validate()) {
//       try {
//         final response = await _authService.raqLinkVerify(raqCode);
//         // log('hello started');

//         // _loaderProvider.simulateDemoIsLoaderDelay();
//         if (response.statusCode == 200) {
//           final DataStorage dataStorage = DataStorage();
//           LoginResponse? loginResponse = await dataStorage.getLoginResponse();

//           final RAQVerification model = RAQVerification(
//             userId: loginResponse!.user.id,
//             role: loginResponse.user.role,
//             associateId: loginResponse.user.academyId,
//             academyId: response.data['academy']['id'],
//             isOrientationTeam: response.data['academy']['isOrientationTeam'],
//           );
//           await _authService.raqLinkVerifyUser(model);

//           _messageHandler.showErrorMessage(context, response.statusCode ?? 200, "raq code verified");
//           // Navigator.of(context).push(MaterialPageRoute(
//           //   builder: (context) => const RaqSucessScreen(),
//           // ));
//           // Future.delayed(const Duration(milliseconds: 500), () {
//           //   Navigator.of(context).push(
//           //     MaterialPageRoute(
//           //       builder: (context) => const AccountVerificationScreen(),
//           //     ),
//           //   );
//           // });
//         } else {
//           // Handle other status codes
//           // _messageHandler.showErrorMessage(
//           //     context, response.statusCode ?? 500, 'Failed to verify: ${response.statusCode}');
//         }
//       } catch (error) {
//         // Handle DioError or other exceptions
//         // ignore: deprecated_member_use
//         if (error is DioError) {
//           if (error.response?.statusCode == 404) {
//             _messageHandler.showErrorMessage(
//                 context, error.response?.statusCode ?? 404, 'RAQ Code $raqCode is not available.');
//           } else {
//             final errorMessage = error.response?.data['message'] ?? 'Unknown error';
//             _messageHandler.showErrorMessage(
//                 context, error.response?.statusCode ?? 500, 'Failed to verify raq code: $errorMessage');
//           }
//         } else {
//           _messageHandler.showErrorMessage(context, 500, 'raq code verify failed');
//         }
//       }
//     }
//   }
// }

// class VerificationResponse {
//   String status;
//   Academy academy;

//   VerificationResponse({required this.status, required this.academy});

//   factory VerificationResponse.fromJson(Map<String, dynamic> json) {
//     return VerificationResponse(
//       status: json['status'],
//       academy: Academy.fromJson(json['academy']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'academy': academy.toJson(),
//     };
//   }
// }

// class Academy {
//   int id;
//   int isOrientationTeam;

//   Academy({required this.id, required this.isOrientationTeam});

//   factory Academy.fromJson(Map<String, dynamic> json) {
//     return Academy(
//       id: json['id'],
//       isOrientationTeam: json['isOrientationTeam'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'isOrientationTeam': isOrientationTeam,
//     };
//   }
// }

// class RAQVerification {
//   int? userId;
//   int? role;
//   int? associateId;
//   int? academyId;
//   int? isOrientationTeam;

//   RAQVerification(
//       {required this.userId,
//       required this.role,
//       required this.associateId,
//       required this.academyId,
//       required this.isOrientationTeam});

//   factory RAQVerification.fromJson(Map<String, dynamic> json) {
//     return RAQVerification(
//       userId: json['userId'],
//       role: json['role'],
//       associateId: json['associateId'],
//       academyId: json['academyId'],
//       isOrientationTeam: json['isOrientationTeam'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'userId': userId,
//       'role': role,
//       'associateId': associateId,
//       'academyId': academyId,
//       'isOrientationTeam': isOrientationTeam,
//     };
//   }
// }
