import 'package:flutter/material.dart';

class Playerprofile extends ChangeNotifier {
  String? _selectedProfile;

  // Getter to retrieve the currently selected profile
  String? get selectedProfile => _selectedProfile;

  // Method to select a profile
  void selectProfile(String profile) {
    _selectedProfile = profile;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to clear the selected profile
  void clearProfile() {
    _selectedProfile = null;
    notifyListeners(); // Notify listeners to update the UI
  }
}
