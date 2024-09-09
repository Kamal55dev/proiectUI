import 'package:flutter_riverpod/flutter_riverpod.dart';

// State provider to manage the OTP input
final otpProvider = StateProvider<String>((ref) => '');

// State provider to manage the timer
final timerProvider = StateProvider<int>((ref) => 60);
