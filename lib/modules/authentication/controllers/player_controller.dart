import 'dart:io';
import 'package:badminton/core/models/authentication/login_user_model.dart';
import 'package:badminton/core/utils/data_storage.dart';
import 'package:badminton/modules/authentication/controllers/loader.dart';
import 'package:badminton/services/auth_service/auth_service.dart';
import 'package:badminton/services/profile_services/profile_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider = StateNotifierProvider<ProfileController, ProfileState>((ref) {
  const state = ProfileState();
  ref.onDispose(state.dispose);
  return ProfileController(
      state, ref.read(authServiceProvider), ref.read(loaderProvider), ref.read(profileServiceProvider));
});

class ProfileController extends StateNotifier<ProfileState> {
  final AuthService authServiceProvider;
  final ProfileServices _profileServices;

  final LoaderScreenController _loaderProvider;

  ProfileController(super.state, this.authServiceProvider, this._loaderProvider, this._profileServices) {
    _initialize();
  }

  void _initialize() async {
    Future.microtask(() async {
      _loaderProvider.simulateDemoIsLoaderDelay();
      state = state.copyWith(isLoading: true);
      final loginResponse = await DataStorage().getLoginResponse();
      await fetchProfileImage();
      state = state.copyWith(loginUser: loginResponse?.user);
    });
  }

  // Future<Future<LoginUser?>> _getUserInfo() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   return authServiceProvider.getUserInfo('');
  // }

  void uploadImage(File file) async {
    state = state.copyWith(isUploadingImage: true);
    await _profileServices.uploadImage(file);
    uplodFetchProfileImage();
    state = state.copyWith(isUploadingImage: false);
  }

  Future<void> fetchProfileImage() async {
    if (state.loginUser?.displayImage != null && state.loginUser!.displayImage != "") {
      final imageUrl = await _profileServices.getProfileImage();
      state = state.copyWith(profileImageUrl: imageUrl);
    }
  }

  void updateProfileImage(String imageUrl) async {
    final profileImageUrl = await _profileServices.getProfileImage();

    state = state.copyWith(profileImageUrl: profileImageUrl);
  }

  void uplodFetchProfileImage() async {
    final imageUrl = await _profileServices.getProfileImage();
    final uniqueImageUrl = '$imageUrl?timestamp=${DateTime.now().millisecondsSinceEpoch}';
    state = state.copyWith(profileImageUrl: uniqueImageUrl);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}

class ProfileState {
  final LoginUser? loginUser;
  final bool isLoading;
  final bool isUploadingImage;
  final String? profileImageUrl;

  const ProfileState({
    this.loginUser,
    this.isLoading = false,
    this.isUploadingImage = false,
    this.profileImageUrl,
  });

  ProfileState copyWith({
    LoginUser? loginUser,
    bool? isLoading,
    bool? isUploadingImage,
    String? profileImageUrl,
  }) {
    return ProfileState(
      loginUser: loginUser ?? this.loginUser,
      isLoading: isLoading ?? this.isLoading,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  void dispose() {}
}
