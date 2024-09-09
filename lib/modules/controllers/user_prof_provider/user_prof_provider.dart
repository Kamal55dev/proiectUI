import 'package:flutter/material.dart';

// Define the ProfileController to manage selected profile state
class ProfileController with ChangeNotifier {
  String? _selectedProfile;

  String? get selectedProfile => _selectedProfile;

  void selectProfile(String profile) {
    _selectedProfile = profile;
    notifyListeners();
  }

  void clearProfile() {
    _selectedProfile = null;
    notifyListeners();
  }
}
