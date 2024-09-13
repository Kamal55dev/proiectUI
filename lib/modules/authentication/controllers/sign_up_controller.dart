// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:badminton/common/message_view.dart';
import 'package:badminton/core/models/authentication/sign_up_model.dart';
import 'package:badminton/core/utils/data_storage.dart';
import 'package:badminton/modules/authentication/controllers/loader.dart';
import 'package:badminton/modules/user_prof_module.dart/user_prof.dart';
import 'package:badminton/services/auth_service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpControllerProvider = StateNotifierProvider<SignUpController, SignUpState>((ref) {
  final state = SignUpState(
    fullNameController: TextEditingController(),
    emailController: TextEditingController(),
    phoneNumberController: TextEditingController(),
    dateOfBirthController: TextEditingController(),
    addressController: TextEditingController(),
    signUpKey: GlobalKey<FormState>(debugLabel: 'signUpKey'),
    color: Colors.white,
    raqLinkCode: TextEditingController(),
  );
  ref.onDispose(state.dispose);
  return SignUpController(state, ref.read(loaderProvider), ref.read(authServiceProvider), ref.read(messageProvider),
      ref.read(dataStorageProvider));
});

class SignUpController extends StateNotifier<SignUpState> {
  final LoaderScreenController _loaderProvider;
  final AuthService _authService;
  final MessageHandler _messageHandler;
  final DataStorage _dataStorage;

  SignUpController(super.state, this._loaderProvider, this._authService, this._messageHandler, this._dataStorage) {
    state.raqLinkCode.addListener(_onRaqLinkCodeChanged);
  }

  void toggleVisibility() {
    state = state.copyWith(obscureText: !state.obscureText);
  }

  void login(BuildContext context) {
    // Navigator.pushNamed(context, CommonAppRoutes.initial);
  }

  void togglePrivacyPolicy(bool value) {
    state = state.copyWith(acceptPrivacyPolicy: value);
  }

  Future<void> signUp(BuildContext context) async {
    log('onnnnn');
    if (state.signUpKey.currentState == null || !state.signUpKey.currentState!.validate()) {
      log('sign keyy');
      return;
    }
    state.signUpKey.currentState!.save();
    _loaderProvider.setLoader(true);
    try {
      Response response = await _authService.register(state.toSignUpModel());
      _loaderProvider.setLoader(false);
      log(response.toString());
      if (response.statusCode == 201 && context.mounted) {
        log('success');
        _messageHandler.showErrorMessage(context, response.statusCode!, 'Sign Up Successful');
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserProfile(),
        ));
      } else if (context.mounted) {
        _messageHandler.showErrorMessage(context, response.statusCode!, 'Unexpected error, please try again later.');
      }
    } on DioException catch (e) {
      _loaderProvider.setLoader(false);
      int statusCode = e.response?.statusCode ?? 500;
      if (context.mounted) {
        if (statusCode == 409) {
          _messageHandler.showErrorMessage(context, 409, "Email Id is already registered");
        } else {
          _messageHandler.showErrorMessage(
              context, statusCode, "An unexpected error occurred. Please try again later.");
        }
      }
    } catch (error) {
      log(error.toString());
      _loaderProvider.setLoader(false);
      if (context.mounted) {
        _messageHandler.showErrorMessage(context, 500, 'An unexpected error occurred. Please try again later.');
      }
    }
  }

  bool checkValidations() {
    if (!state.acceptPrivacyPolicy) {
      state = state.copyWith(color: Colors.red);
      return false;
    }

    return true;
  }

  void reset() {
    state.fullNameController.clear();
    state.emailController.clear();
    state.phoneNumberController.clear();
    state.dateOfBirthController.clear();
    state.addressController.clear();
    state.raqLinkCode.clear();
    state = state.copyWith(color: Colors.white);
  }

  void _onRaqLinkCodeChanged() {
    if (state.raqLinkCode.text.length == 10) {
      state = state.copyWith(isLoading: true);
    }
  }

  @override
  void dispose() {
    state.raqLinkCode.removeListener(_onRaqLinkCodeChanged);
    state.emailController.dispose();
    state.fullNameController.dispose();
    state.phoneNumberController.dispose();
    state.dateOfBirthController.dispose();
    state.addressController.dispose();
    super.dispose();
  }
}

class SignUpState {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController dateOfBirthController; // New field for dateOfBirth
  final TextEditingController addressController; // New field for address
  final GlobalKey<FormState> signUpKey;
  final bool obscureText;
  final bool acceptPrivacyPolicy;
  final Color color;
  final TextEditingController raqLinkCode;
  final bool isLoading;

  SignUpState({
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.dateOfBirthController,
    required this.addressController,
    required this.signUpKey,
    this.obscureText = true,
    this.acceptPrivacyPolicy = false,
    required this.color,
    required this.raqLinkCode,
    this.isLoading = false,
  });

  SignUpState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? phoneNumberController,
    TextEditingController? authTypeController,
    TextEditingController? dateOfBirthController,
    TextEditingController? addressController,
    GlobalKey<FormState>? signUpKey,
    bool? obscureText,
    bool? acceptPrivacyPolicy,
    Color? color,
    TextEditingController? raqLinkCode,
    bool? isLoading,
  }) {
    return SignUpState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      phoneNumberController: phoneNumberController ?? this.phoneNumberController,
      dateOfBirthController: dateOfBirthController ?? this.dateOfBirthController,
      addressController: addressController ?? this.addressController,
      signUpKey: signUpKey ?? this.signUpKey,
      obscureText: obscureText ?? this.obscureText,
      acceptPrivacyPolicy: acceptPrivacyPolicy ?? this.acceptPrivacyPolicy,
      color: color ?? this.color,
      raqLinkCode: raqLinkCode ?? this.raqLinkCode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
  }

  SignUpModel toSignUpModel() {
    return SignUpModel(
      name: fullNameController.text,
      email: emailController.text,
      mobileNumber: phoneNumberController.text,
      dateOfBirth: dateOfBirthController.text, // Updated for dateOfBirth
      address: addressController.text, // Updated for address
    );
  }
}
