import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/player_prof_provider/player_prof_provider_3.dart';

// ignore: camel_case_types
class PlayingProf_3 extends ConsumerWidget {
  const PlayingProf_3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGameType = ref.watch(playingProfileControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image at the top
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bg_images/Looper BG.png', // Background image path
              fit: BoxFit
                  .cover, // Ensures the image covers the top of the screen
              height: MediaQuery.of(context).size.height *
                  0.4, // Adjust height as needed
            ),
          ),
          // Safe area to avoid system elements
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30), // Space for content
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
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context); // Handle Previous button action
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Previous',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: selectedGameType != null
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PlayingProf_3(),
                                    ));
                              }
                            : null,
                        label: const Text(
                          'Finish',
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Colors.white),
                        ),
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedGameType != null
                              ? const Color(0xFFDAA520)
                              : Colors.grey.withOpacity(0.3),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
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
