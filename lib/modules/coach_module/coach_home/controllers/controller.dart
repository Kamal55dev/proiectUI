// lib/controllers/rak_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RAKState {
  final String userName;
  final String academyName;

  RAKState({required this.userName, required this.academyName});
}

class RAKController extends StateNotifier<RAKState> {
  RAKController() : super(RAKState(userName: 'RAK', academyName: 'Super Smash Badminton Academy'));

  void updateUserName(String newName) {
    state = RAKState(userName: newName, academyName: state.academyName);
  }

  void updateAcademyName(String newName) {
    state = RAKState(userName: state.userName, academyName: newName);
  }
}

final rakControllerProvider = StateNotifierProvider<RAKController, RAKState>((ref) {
  return RAKController();
});
