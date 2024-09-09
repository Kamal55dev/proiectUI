

// Models
class User {
  final String name;
  final String location;
  final String level;
  final String avatarUrl;

  User({required this.name, required this.location, required this.level, required this.avatarUrl});
}

class Match {
  final DateTime date;
  final String type;
  final String player1;
  final String player2;
  final List<int> score1;
  final List<int> score2;

  Match({
    required this.date,
    required this.type,
    required this.player1,
    required this.player2,
    required this.score1,
    required this.score2,
  });
}