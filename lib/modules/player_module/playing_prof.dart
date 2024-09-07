import 'package:badminton/modules/controllers/player_prof_provider/player_prof_provider.dart';
import 'package:badminton/modules/player_module/playing_prof_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingProfile extends StatelessWidget {
  const PlayingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the entire MaterialApp with MultiProvider in main.dart or wrap the specific widget here
    return ChangeNotifierProvider(
      create: (_) => Playerprofile(),
      builder: (context, child) {
        // Use builder to ensure proper context
        return Scaffold(
          backgroundColor: const Color(0xFF1C1C1E), // Dark background color
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Looper BG.png', // Replace with your background image path
                  fit: BoxFit.cover,
                  // color: Colors.transparent.withOpacity(0.5),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Consumer<Playerprofile>(
                    builder: (context, profileController, child) {
                      final selectedProfile = profileController.selectedProfile;

                      return Column(
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
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.white),
                                onPressed: () {
                                  // Close or navigate away action
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'What is your playing level ?',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: ['Beginner', 'Intermediate', 'Advance']
                                .map((profile) {
                              return ChoiceChip(
                                label: Text(profile),
                                selected: selectedProfile == profile,
                                onSelected: (isSelected) {
                                  if (isSelected) {
                                    profileController.selectProfile(profile);
                                  } else {
                                    profileController.clearProfile();
                                  }
                                },
                                selectedColor: const Color(0xFFDAA520),
                                backgroundColor: Colors.grey[800],
                                labelStyle: TextStyle(
                                  color: selectedProfile == profile
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                side: const BorderSide(
                                  color: Colors.grey, // Border color
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
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
                              onPressed: selectedProfile != null
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Playing1(),
                                          ));
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: selectedProfile != null
                                    ? Colors.black
                                    : Colors.white.withOpacity(0.5),
                                backgroundColor: selectedProfile != null
                                    ? const Color(0xFFDAA520)
                                    : Colors.grey.withOpacity(0.3),
                                elevation: selectedProfile != null ? 5 : 0,
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
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
