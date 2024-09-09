import 'package:badminton/modules/player_module/playing_prof_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/player_prof_provider/player_prof_provider_2.dart'; // Import the provider

// ignore: camel_case_types
class Playing_2 extends ConsumerWidget {
  const Playing_2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the selected frequency from the provider
    final selectedFrequency =
        ref.watch(playingProfProvider2); // No casting needed

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Dark background color
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Looper BG.png', // Background image path
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Playing Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Close or navigate away
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'When did you last train?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Option selection using ChoiceChips
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: PlayingFrequency.values.map((frequency) {
                      return ChoiceChip(
                        label: Text(_frequencyLabel(frequency)),
                        selected: selectedFrequency == frequency,
                        onSelected: (isSelected) {
                          if (isSelected) {
                            // Update the selected frequency in the provider
                            ref
                                .read(playingProfProvider2.notifier)
                                .selectFrequency(frequency);
                          }
                        },
                        selectedColor: const Color(0xFFDAA520),
                        backgroundColor: Colors.grey[800],
                        labelStyle: TextStyle(
                          color: selectedFrequency == frequency
                              ? Colors.black
                              : Colors.white,
                        ),
                        side: const BorderSide(
                          color: Colors.grey, // Border color
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 60),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // GestureDetector for Previous

                      GestureDetector(
                        onTap: () {
                          // Handle Previous button action
                          Navigator.pop(context);
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
                      // ElevatedButton for Next
                      ElevatedButton.icon(
                        onPressed: selectedFrequency != null
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
                          'Next',
                          style: TextStyle(
                              fontFamily: 'Poppins', color: Colors.white),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedFrequency != null
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

  // Helper function to map frequency enums to user-friendly labels
  String _frequencyLabel(PlayingFrequency frequency) {
    switch (frequency) {
      case PlayingFrequency.currentlyTraining:
        return 'Currently Training';
      case PlayingFrequency.lastMonth:
        return 'Last Month';
      case PlayingFrequency.lastYear:
        return 'Last Year';
      case PlayingFrequency.beenAWhile:
        return 'It\'s been a while';
      case PlayingFrequency.never:
        return 'Never';
      default:
        return '';
    }
  }
}
