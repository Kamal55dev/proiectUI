import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define options as an enum for playing levels
enum PlayingFrequency {
  daily,
  onceAWeek,
  moreThanOnceAWeek,
  rarely,
}

// StateNotifier to handle playing frequency state
class Playingcontroller1 extends StateNotifier<PlayingFrequency?> {
  Playingcontroller1() : super(null); // Initially no selection

  // Update selected option
  void updateFrequency(PlayingFrequency frequency) {
    state = frequency;
  }
}

// Provider for Playinglevelcontroller
final playingProfileProvider =
    StateNotifierProvider<Playingcontroller1, PlayingFrequency?>((ref) {
  return Playingcontroller1();
});
