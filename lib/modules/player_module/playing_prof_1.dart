import 'package:badminton/modules/player_module/playing_prof_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/player_prof_provider/playing_prof_provider_1.dart';

class Playing1 extends ConsumerWidget {
  const Playing1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrequency = ref.watch(playingProfileProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Dark background color
      body: Stack(
        children: [
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
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double screenHeight = constraints.maxHeight;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Playing Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  screenWidth * 0.06, // Responsive font size
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context); // Go back or close
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'How often do you play?',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenWidth * 0.05, // Responsive font size
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Wrap(
                        spacing: screenWidth * 0.03, // Responsive spacing
                        runSpacing: screenHeight * 0.01, // Responsive spacing
                        children: PlayingFrequency.values.map((frequency) {
                          return ChoiceChip(
                            label: Text(_frequencyLabel(frequency)),
                            selected: selectedFrequency == frequency,
                            onSelected: (isSelected) {
                              if (isSelected) {
                                ref
                                    .read(playingProfileProvider.notifier)
                                    .updateFrequency(frequency);
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
                              borderRadius: BorderRadius.circular(screenWidth *
                                  0.05), // Responsive border radius
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                          height: screenHeight * 0.1), // Responsive spacing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context); // Handle Previous button action
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: screenWidth *
                                      0.05, // Responsive icon size
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  'Previous',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: screenWidth *
                                        0.04, // Responsive font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: selectedFrequency != null
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Playing_2(),
                                        ));
                                  }
                                : null,
                            label: Text(
                              'Next',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: screenWidth *
                                      0.04), // Responsive font size
                            ),
                            // icon: const Icon(
                            //   Icons.arrow_forward,
                            //   color: Colors.white,
                            // ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedFrequency != null
                                  ? const Color(0xFFDAA520)
                                  : Colors.grey.withOpacity(0.3),
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      screenHeight * 0.02, // Responsive padding
                                  horizontal:
                                      screenWidth * 0.05), // Responsive padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    screenWidth *
                                        0.03), // Responsive border radius
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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
