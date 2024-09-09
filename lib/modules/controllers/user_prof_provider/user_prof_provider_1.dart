import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum for language selection
enum Language { english, spanish }

class UserProfileController extends StateNotifier<UserProfileState> {
  UserProfileController() : super(UserProfileState());

  // Toggle notifications
  void toggleNotifications() {
    state = state.copyWith(notificationsEnabled: !state.notificationsEnabled);
  }

  // Update language
  void updateLanguage(Language language) {
    state = state.copyWith(selectedLanguage: language);
  }
}

// Class to represent the user's profile state
class UserProfileState {
  final String profileImageUrl;
  final String userName;
  final String rakCode;
  final String email;
  final String phone;
  final bool notificationsEnabled;
  final Language selectedLanguage;

  UserProfileState({
    this.profileImageUrl =
        'https://example.com/profile.jpg', // Default image URL
    this.userName = 'Lee Chong Wei',
    this.rakCode = '66326',
    this.email = 'rakesh@gmail.com',
    this.phone = '+91 948 948 0320',
    this.notificationsEnabled = false,
    this.selectedLanguage = Language.english,
  });

  // Copy method to create a modified copy of the state
  UserProfileState copyWith({
    String? profileImageUrl,
    String? userName,
    String? rakCode,
    String? email,
    String? phone,
    bool? notificationsEnabled,
    Language? selectedLanguage,
  }) {
    return UserProfileState(
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      userName: userName ?? this.userName,
      rakCode: rakCode ?? this.rakCode,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}

// Provider for the user profile controller
final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, UserProfileState>(
        (ref) => UserProfileController());
