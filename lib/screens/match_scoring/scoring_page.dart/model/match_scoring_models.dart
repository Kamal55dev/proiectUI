import '../../../../modules/player_models/Match_scoring_model.dart';

class Match {
  String opponent;
  String matchType;
  List<Player> players;
  String comment;

  Match({
    required this.opponent,
    required this.matchType,
    required this.players,
    this.comment = '', // Default to an empty string
  });
}
