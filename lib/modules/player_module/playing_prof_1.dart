import 'package:badminton/modules/player_module/playing_prof_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/player_prof_provider/playing_prof_provider_1.dart';

class Playing1 extends ConsumerWidget {
  const Playing1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the selected frequency from the provider
    final selectedFrequency = ref.watch(playingProfileProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Dark background color
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_images/Looper Bg image.png', // Background image
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
                            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
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
                    'How often do you play?',
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
                            ref.read(playingProfileProvider.notifier).updateFrequency(frequency);
                          }
                        },
                        selectedColor: const Color(0xFFDAA520),
                        backgroundColor: Colors.grey[800],
                        labelStyle: TextStyle(
                          color: selectedFrequency == frequency ? Colors.black : Colors.white,
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
                  const SizedBox(height: 80),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: selectedFrequency != null
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Playing_2(),
                                  ));
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selectedFrequency != null ? Colors.black : Colors.white.withOpacity(0.5),
                        backgroundColor:
                            selectedFrequency != null ? const Color(0xFFDAA520) : Colors.grey.withOpacity(0.3),
                        elevation: selectedFrequency != null ? 5 : 0,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
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

  // Helper function to map frequency enums to user-friendly labels
  String _frequencyLabel(PlayingFrequency frequency) {
    switch (frequency) {
      case PlayingFrequency.daily:
        return 'Daily';
      case PlayingFrequency.onceAWeek:
        return 'Once a week';
      case PlayingFrequency.moreThanOnceAWeek:
        return 'More than once a week';
      case PlayingFrequency.rarely:
        return 'Rarely';
      default:
        return '';
    }
  }
}
