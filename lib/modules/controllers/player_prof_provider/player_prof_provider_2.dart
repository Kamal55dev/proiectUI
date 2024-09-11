import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum to represent the different playing frequencies
enum PlayingFrequency {
  currentlyTraining,
  lastMonth,
  lastYear,
  beenAWhile,
  never,
}

// Notifier to manage the selected frequency
class PlayingProfProvider2Notifier extends StateNotifier<PlayingFrequency?> {
  PlayingProfProvider2Notifier() : super(null); // No selection by default

  // Method to update the selected frequency
  void selectFrequency(PlayingFrequency frequency) {
    state = frequency;
  }
}

// Define the provider for the notifier
final playingProfProvider2 =
    StateNotifierProvider<PlayingProfProvider2Notifier, PlayingFrequency?>(
        (ref) {
  return PlayingProfProvider2Notifier();
});
