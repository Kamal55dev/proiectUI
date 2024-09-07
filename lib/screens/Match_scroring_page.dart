// ui/match_scoring_screen.dart

// ignore_for_file: unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/provider/match_scoring_provider.dart';
import '../modules/player_models/Match_scoring_model.dart';

class MatchScoringScreen extends ConsumerWidget {
  const MatchScoringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Match Scoring'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(match),
              const SizedBox(height: 20),
              const Text('What kind of match is this?', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              _buildMatchTypeButtons(ref),
              const SizedBox(height: 20),
              _buildOpponentField(match),
              const SizedBox(height: 20),
              _buildScoreInputFields(ref), // Updated score input fields
              const SizedBox(height: 20),
              _buildCommentsField(ref),
              const SizedBox(height: 20),
              _buildActionButtons(ref),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Card
  Widget _buildProfileCard(Match match) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF292B2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lee Chong Wei',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildTag('Advance'),
                  const SizedBox(width: 130),
                  _buildLocationTag(Icons.location_on, 'Kuala Lumpur'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Tag widget
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF9254FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  // Location Tag
  Widget _buildLocationTag(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  // Match Type Buttons
  Widget _buildMatchTypeButtons(WidgetRef ref) {
    final matchType = ref.watch(matchProvider).matchType;
    return Row(
      children: ['Tournament', 'League', 'Sparring'].map((type) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            onPressed: () => ref.read(matchProvider.notifier).updateMatchType(type),
            style: ElevatedButton.styleFrom(
              backgroundColor: matchType == type ? Colors.orange : Colors.grey[800],
            ),
            child: Text(type),
          ),
        );
      }).toList(),
    );
  }

  // Opponent Field
  Widget _buildOpponentField(Match match) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: match.opponent,
        hintStyle: const TextStyle(color: Colors.white54),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  // Score Input Fields
  // Score Input Fields
Widget _buildScoreInputFields(WidgetRef ref) {
  final match = ref.watch(matchProvider);

  return Column(
    children: [
      _buildPlayerScoreSection(ref, 0, match.players[0], 'Lee Chong Wei'), // For player 1
      const SizedBox(height: 20),
      _buildPlayerScoreSection(ref, 1, match.players[1], 'Opponent'), // For player 2
    ],
  );
}

// Build Score Section for Player
Widget _buildPlayerScoreSection(WidgetRef ref, int playerIndex, Player player, String playerName) {
  return Row(
    children: [
      _buildPlayerInfo(playerName),
      const SizedBox(width: 16),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (gameIndex) {
            return _buildScoreBox(ref, playerIndex, gameIndex, player.scores[gameIndex]);
          }),
        ),
      ),
    ],
  );
}

// Player Info (Avatar and Name)
Widget _buildPlayerInfo(String playerName) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
      ),
      const SizedBox(width: 8),
      Text(
        playerName,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

// Score Box
Widget _buildScoreBox(WidgetRef ref, int playerIndex, int gameIndex, int initialValue) {
  return SizedBox(
    width: 50,
    child: TextField(
      controller: TextEditingController(text: initialValue.toString()),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        final score = int.tryParse(value) ?? 0;
        ref.read(matchProvider.notifier).updatePlayerScore(playerIndex, gameIndex, score);
      },
    ),
  );
}


  // Comments Field
  Widget _buildCommentsField(WidgetRef ref) {
    final match = ref.watch(matchProvider);

    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Add Comments',
        hintStyle: const TextStyle(color: Colors.white54),
      ),
      style: const TextStyle(color: Colors.white),
      maxLines: 3,
      onChanged: (value) => ref.read(matchProvider.notifier).updateComment(value),
    );
  }

  // Action Buttons (Update and Delete)
  Widget _buildActionButtons(WidgetRef ref) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle update logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Update'),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => ref.read(matchProvider.notifier).deleteMatch(),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Delete this Match', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
