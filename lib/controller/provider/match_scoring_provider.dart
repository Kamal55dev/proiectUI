// providers/match_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../modules/player_models/Match_scoring_model.dart';

class MatchNotifier extends StateNotifier<Match> {
  MatchNotifier()
      : super(Match(
          opponent: 'Jayakumar',  // Initial opponent name
          matchType: 'Trials',
          players: [
            Player(name: 'Lee Chong Wei', imageUrl: 'assets/images/player1.png', scores: [21, 18, 21]),
            Player(name: 'Jayakumar', imageUrl: 'assets/images/player2.png', scores: [12, 21, 15]),
          ],
          comments: '',
        ));

  // Method to update player scores
  void updatePlayerScore(int playerIndex, int gameIndex, int score) {
    final updatedPlayers = [...state.players]; // Copy the players list
    final updatedScores = [...updatedPlayers[playerIndex].scores];
    updatedScores[gameIndex] = score; // Update the specific score

    updatedPlayers[playerIndex] =
        updatedPlayers[playerIndex].copyWith(scores: updatedScores);

    state = state.copyWith(players: updatedPlayers); // Update the state with new players
  }

  // Method to update comments
  void updateComment(String comment) {
    state = state.copyWith(comments: comment);
  }

  // Method to update match type
  void updateMatchType(String matchType) {
    state = state.copyWith(matchType: matchType);
  }

  // Method to delete match (reset to initial state)
  void deleteMatch() {
    state = Match(
      opponent: '',
      matchType: '',
      players: [],
      comments: '',
    );
  }
}

final matchProvider =
    StateNotifierProvider<MatchNotifier, Match>((ref) => MatchNotifier());
