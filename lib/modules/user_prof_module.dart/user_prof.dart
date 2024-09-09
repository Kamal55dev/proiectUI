import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_prof_provider/user_prof_provider.dart';
import 'user_profile_1.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg_images/Looper BG.png',
                fit: BoxFit.cover,
              ),
            ),
            // Main Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Consumer<ProfileController>(
                  builder: (context, profileController, child) {
                    final selectedProfile = profileController.selectedProfile;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        // Header Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'User Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                // Close or navigate away action
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Welcome Text
                        const Row(
                          children: [
                            Text(
                              'Welcome to RAK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.emoji_emotions,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),

                        // Question Text
                        const Text(
                          'How would you like to use the app?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Profile Options
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ['Coach', 'Player', 'Fan'].map((profile) {
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),

                        // Note
                        const Row(
                          children: [
                            Icon(Icons.info, color: Colors.white54, size: 20),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Once a user profile is chosen, you can’t go back',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),

                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: selectedProfile != null
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProfile_1(),
                                        ));
                                  }
                                : null, // Disable the button's functionality if no profile selected
                            style: ElevatedButton.styleFrom(
                              foregroundColor: selectedProfile != null
                                  ? Colors.black
                                  : Colors.black.withOpacity(0.5),
                              backgroundColor: selectedProfile != null
                                  ? const Color(
                                      0xFFDAA520) // Gold color when enabled
                                  : Colors.grey.withOpacity(
                                      0.3), // More transparent grey when disabled
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
      ),
    );
  }
}
