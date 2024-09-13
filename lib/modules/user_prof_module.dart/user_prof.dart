import 'package:badminton/modules/coach_module/coach_profile/views/coach_profilescreen.dart';
import 'package:badminton/modules/player_module/playing_prof_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_prof_provider/user_prof_provider.dart';
import 'user_profile_1.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimationCoach;
  late Animation<double> _fadeAnimationPlayer;
  late Animation<double> _fadeAnimationFan;
  late Animation<Offset> _slideAnimationQuestionText;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Initialize Fade Animations for the profiles
    _fadeAnimationCoach = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.67, curve: Curves.easeIn),
      ),
    );

    _fadeAnimationPlayer = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.67, 0.83, curve: Curves.easeIn),
      ),
    );

    _fadeAnimationFan = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.83, 1.0, curve: Curves.easeIn),
      ),
    );

    // Slide Animation specifically for the question text
    _slideAnimationQuestionText = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Background Image
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 500,
                    width: constraints.maxWidth,
                    child: Image.asset(
                      'assets/images/bg_images/Looper BG.png',
                      fit: BoxFit.cover,
                    ),
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
                                  icon: const Icon(Icons.close, color: Colors.white),
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

                            // Question Text with Slide Transition
                            SlideTransition(
                              position: _slideAnimationQuestionText,
                              child: const Text(
                                'How would you like to use the app?',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Profile Options with staggered fade animations
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: FadeTransition(
                                    opacity: _fadeAnimationCoach,
                                    child: ChoiceChip(
                                      label: const Text('Coach'),
                                      selected: selectedProfile == 'Coach',
                                      onSelected: (isSelected) {
                                        if (isSelected) {
                                          profileController.selectProfile('Coach');
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //   builder: (context) => CoachProfile(),
                                          // ));
                                        } else {
                                          profileController.clearProfile();
                                        }
                                      },
                                      selectedColor: const Color(0xFFDAA520),
                                      backgroundColor: Colors.grey[800],
                                      labelStyle: TextStyle(
                                        color: selectedProfile == 'Coach' ? Colors.black : Colors.white,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: FadeTransition(
                                    opacity: _fadeAnimationPlayer,
                                    child: ChoiceChip(
                                      label: const Text('Player'),
                                      selected: selectedProfile == 'Player',
                                      onSelected: (isSelected) {
                                        if (isSelected) {
                                          profileController.selectProfile('Player');
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //   builder: (context) => Playing1(),
                                          // ));
                                        } else {
                                          profileController.clearProfile();
                                        }
                                      },
                                      selectedColor: const Color(0xFFDAA520),
                                      backgroundColor: Colors.grey[800],
                                      labelStyle: TextStyle(
                                        color: selectedProfile == 'Player' ? Colors.black : Colors.white,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: FadeTransition(
                                    opacity: _fadeAnimationFan,
                                    child: ChoiceChip(
                                      label: const Text('Fan'),
                                      selected: selectedProfile == 'Fan',
                                      onSelected: (isSelected) {
                                        if (isSelected) {
                                          profileController.selectProfile('Fan');
                                        } else {
                                          profileController.clearProfile();
                                        }
                                      },
                                      selectedColor: const Color(0xFFDAA520),
                                      backgroundColor: Colors.grey[800],
                                      labelStyle: TextStyle(
                                        color: selectedProfile == 'Fan' ? Colors.black : Colors.white,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                              ],
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
                                            builder: (context) => const UserProfile_1(),
                                          ),
                                        );
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      selectedProfile != null ? Colors.black : Colors.black.withOpacity(0.5),
                                  backgroundColor:
                                      selectedProfile != null ? const Color(0xFFDAA520) : Colors.grey.withOpacity(0.3),
                                  elevation: selectedProfile != null ? 5 : 0,
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
                                    // Icon(
                                    //   Icons.arrow_forward,
                                    //   size: 20,
                                    // ),
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
            );
          },
        ),
      ),
    );
  }
}
