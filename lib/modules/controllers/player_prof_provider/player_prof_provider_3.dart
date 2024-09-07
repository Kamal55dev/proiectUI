import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum to represent game type
enum GameType { singles, doubles, both }

// StateNotifier to manage the selected game type
class PlayingProfController_3 extends StateNotifier<GameType?> {
  PlayingProfController_3() : super(null); // Initial state is no selection

  // Function to update the selected game type
  void selectGameType(GameType? type) {
    state = type;
  }
}

// Riverpod provider for PlayingProfileController
final playingProfileControllerProvider =
    StateNotifierProvider<PlayingProfController_3, GameType?>(
        (ref) => PlayingProfController_3());
