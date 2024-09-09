import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/player_models/rak_podium_model.dart';


final userProvider = Provider<User>((ref) {
  return User(
    name: 'Lee Chong Wei',
    location: 'Kuala Lumpur',
    level: 'Advance',
    avatarUrl: 'https://example.com/avatar.jpg',
  );
});

final matchesProvider = Provider<List<Match>>((ref) {
  // In a real app, you'd fetch this data from an API or local database
  return [
    Match(
      date: DateTime(2024, 6, 24, 10, 30),
      type: 'Tournament',
      player1: 'Jessie Doe Stephen Li',
      player2: 'Opponent',
      score1: [21, 18, 21],
      score2: [04, 21, 12],
    ),
    Match(
      date: DateTime(2024, 6, 24, 10, 30),
      type: 'Sparring',
      player1: 'Jessie Doe Stephen Li',
      player2: 'Opponent',
      score1: [21, 18, 21],
      score2: [04, 21, 12],
    ),
    Match(
      date: DateTime(2024, 8, 24, 10, 30),
      type: 'Sparring',
      player1: 'Jessie Doe Stephen Li',
      player2: 'Opponent',
      score1: [21, 18, 21],
      score2: [04, 21, 12],
    ),
  ];
});