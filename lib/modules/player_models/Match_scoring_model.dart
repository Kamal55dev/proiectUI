// models/match_model.dart

class Player {
  final String name;
  final String imageUrl;
  final List<int> scores;

  Player({
    required this.name,
    required this.imageUrl,
    required this.scores,
  });

  Player copyWith({
    String? name,
    String? imageUrl,
    List<int>? scores,
  }) {
    return Player(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      scores: scores ?? this.scores,
    );
  }
}

class Match {
  final String opponent;
  final String matchType;
  final List<Player> players;
  final String comments;

  Match({
    required this.opponent,
    required this.matchType,
    required this.players,
    required this.comments,
  });

  Match copyWith({
    String? opponent,
    String? matchType,
    List<Player>? players,
    String? comments,
  }) {
    return Match(
      opponent: opponent ?? this.opponent,
      matchType: matchType ?? this.matchType,
      players: players ?? this.players,
      comments: comments ?? this.comments,
    );
  }
}
