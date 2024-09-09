import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/player_prof_provider/player_prof_provider_3.dart';

// ignore: camel_case_types
class PlayingProf_3 extends ConsumerWidget {
  const PlayingProf_3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the selected game type state from the controller
    final selectedGameType = ref.watch(playingProfileControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_images/Looper BG.png', // Background image path
              fit: BoxFit.cover, // Ensures the image covers the whole screen
            ),
          ),
          // Safe area to avoid system elements
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  // Title Row with close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Playing Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Go back or close
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Subtitle
                  const Text(
                    'What is your preferred game type?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ChoiceChip widgets for selecting game type
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: GameType.values.map((type) {
                      return ChoiceChip(
                        label: Text(
                          _getGameTypeLabel(type),
                          style: const TextStyle(color: Colors.white),
                        ),
                        selected: selectedGameType == type,
                        onSelected: (isSelected) {
                          // Update the selected game type using the controller
                          ref
                              .read(playingProfileControllerProvider.notifier)
                              .selectGameType(isSelected ? type : null);
                        },
                        selectedColor: const Color(0xFFDAA520),
                        backgroundColor: Colors.grey[800],
                        side: const BorderSide(
                          color: Colors.grey, // Border color
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }).toList(),
                  ),
                  // const Spacer(),
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: selectedGameType != null
                          ? () {
                              // Handle the finish action
                              if (kDebugMode) {
                                print("Selected Game Type: $selectedGameType");
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selectedGameType != null
                            ? Colors.black
                            : Colors.white.withOpacity(0.5),
                        backgroundColor: selectedGameType != null
                            ? const Color(0xFFDAA520)
                            : Colors.grey.withOpacity(0.3),
                        elevation: selectedGameType != null ? 5 : 0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Finish',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.check,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to display label for each game type
  String _getGameTypeLabel(GameType type) {
    switch (type) {
      case GameType.singles:
        return 'Singles';
      case GameType.doubles:
        return 'Doubles';
      case GameType.both:
        return 'Both';
      default:
        return '';
    }
  }
}
