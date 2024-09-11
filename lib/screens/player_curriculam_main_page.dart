// import 'package:flutter/material.dart';

// class PlayerCurriculumMainScreen extends StatelessWidget {
//   const PlayerCurriculumMainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Background image with a height of 650
//             Positioned.fill(
//               child: Image.asset(
//                 'assets/images/bg_images/Looper BG (2).png', // Use your background image
//                 fit: BoxFit.cover,
//                 height: 650,
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildHeader(),
//                   const SizedBox(height: 16),
//                   _buildPlayerTitle(),
//                   const SizedBox(height: 16),
//                   _buildActiveCurriculumSection(),
//                   const SizedBox(height: 20),
//                   _buildPreviousCurriculumSection(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Header widget
//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: const [
//               Icon(Icons.arrow_back_ios, color: Colors.white),
//               SizedBox(width: 8),
//               Text(
//                 'Curriculum',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ],
//           ),
//           const Icon(Icons.menu, color: Colors.white),
//         ],
//       ),
//     );
//   }

//   // Player Curriculum Title widget
//   Widget _buildPlayerTitle() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: Text(
//         'Player Curriculum',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   // Currently Active Curriculum Section
//   Widget _buildActiveCurriculumSection() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Currently Active',
//             style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Build the three curriculum cards to match the exact UI
//           _buildCurriculumCard('High Intensity', 'Day 1/12', 'assets/images/player_images/Rectangle 161123592 (4).png', 0.8, Icons.whatshot),
//           const SizedBox(height: 16),
//           _buildCurriculumCard('Low Intensity', 'Day 1/12', 'assets/images/player_images/Rectangle 161123592 (4).png', 0.5, Icons.spa),
//           const SizedBox(height: 16),
//           _buildCurriculumCard('Mid Intensity', 'Day 1/12', 'assets/images/player_images/Rectangle 161123592 (4).png', 0.65, Icons.sports_tennis),
//         ],
//       ),
//     );
//   }

//   // Build each individual Curriculum Card
//   Widget _buildCurriculumCard(String intensity, String dayInfo, String imagePath, double progress, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   imagePath, // Replace with the correct image path
//                   width: 60,
//                   height: 60,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                        
//                           Text(
//                             'Intermediate',
//                             style: const TextStyle(color: Colors.yellow,fontSize: 8),
//                           ),
//                       Row(
//                         children: [
                         
//                           Text(
//                             'Skill training program',
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           const Spacer(),
//                           ElevatedButton.icon(
//                             onPressed: () {
//                               // Add functionality if required
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.yellow,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
                            
//                             label: const Text('Start', style: TextStyle(color: Colors.black)),
//                             icon: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
                          
                          
//                           Text(
//                             intensity,
//                             style: const TextStyle(color: Color.fromARGB(255, 187, 134, 55), fontSize: 14),
//                           ),
//                           const SizedBox(width: 4),
//                           Icon(Icons.arrow_drop_down, color: Colors.yellow, size: 16),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(5),
//                         child: SizedBox(
//                           width: 145,
//                           height: 10,
//                           child: LinearProgressIndicator(
//                             value: progress,
//                             backgroundColor: Colors.grey.shade700,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(dayInfo, style: const TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Previous Curriculum Section
//   Widget _buildPreviousCurriculumSection() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Previous',
//             style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Build the previous curriculum cards with exact UI
//           _buildPreviousCurriculumCard('Beginners skill training program', 'Jaya Prakash', 'assets/images/player_images/Rectangle 161123592 (4).png'),
//           const SizedBox(height: 16),
//           _buildPreviousCurriculumCard('Beginners skill training program', 'Jaya Prakash', 'assets/images/player_images/Rectangle 161123592 (4).png'),
//         ],
//       ),
//     );
//   }

//   // Build each individual Previous Curriculum Card
//   Widget _buildPreviousCurriculumCard(String programName, String coachName, String imagePath) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: ListTile(
//         leading: Image.asset(
//           imagePath, // Replace with the correct image path
//           width: 60,
//           height: 60,
//         ),
//         title: Text(programName, style: const TextStyle(color: Colors.white)),
//         subtitle: Row(
//           children: [
//             CircleAvatar(
//               radius: 12,
//               backgroundColor: Colors.blue,
//               child: Text(coachName.substring(0, 2), style: const TextStyle(color: Colors.white, fontSize: 12)),
//             ),
//             const SizedBox(width: 8),
//             Text('Completed', style: const TextStyle(color: Colors.grey)),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'curriculam_skill_training.dart';

class PlayerCurriculumMainScreen extends StatelessWidget {
  const PlayerCurriculumMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background image with a height of 650
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg_images/Looper BG (2).png', // Use your background image
                fit: BoxFit.cover,
                height: 650,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 16),
                  _buildPlayerTitle(),
                  const SizedBox(height: 16),
                  _buildActiveCurriculumSection(context),
                  const SizedBox(height: 20),
                  _buildPreviousCurriculumSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header widget
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () { Navigator.of(context).pop(); },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              SizedBox(width: 8),
              Text(
                'Curriculum',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          const Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }

  // Player Curriculum Title widget
  Widget _buildPlayerTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Player Curriculum',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Currently Active Curriculum Section
  Widget _buildActiveCurriculumSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Currently Active',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Build the three curriculum cards to match the exact UI
          _buildCurriculumCard(
            context,
            'High Intensity',
            'Day 1/12',
            'assets/images/player_images/Rectangle 161123592 (4).png',
            0.8,
            Icons.whatshot,
            Colors.red,
          ),
          const SizedBox(height: 16),
          _buildCurriculumCard(
            context,
            'Low Intensity',
            'Day 1/12',
            'assets/images/player_images/Rectangle 161123592 (4).png',
            0.5,
            Icons.spa,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildCurriculumCard(
            context,
            'Mid Intensity',
            'Day 1/12',
            'assets/images/player_images/Rectangle 161123592 (4).png',
            0.65,
            Icons.sports_tennis,
            Colors.green,
          ),
        ],
      ),
    );
  }

  // Build each individual Curriculum Card
  Widget _buildCurriculumCard(
    BuildContext context,
    String intensity,
    String dayInfo,
    String imagePath,
    double progress,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background for the cards
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white), // Adding white border
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath, // Replace with the correct image path
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Intermediate',
                        style: const TextStyle(color: Colors.yellow, fontSize: 8),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          // Add an icon next to the intensity text with different icons for each intensity
                          Icon(icon, color: iconColor, size: 16), // Different icon for each intensity
                          const SizedBox(width: 4),
                          Text(
                            intensity,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_drop_down, color: Colors.yellow, size: 16),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: 145,
                          height: 10,
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey.shade700,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      // New Row that includes both Day 1/12 text and Start button
                      Row(
                        children: [
                          Text(dayInfo, style: const TextStyle(color: Colors.grey)),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CurriculamSkillTraining(), // Replace this with your target screen
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // BorderRadius.circular(10) for the button
                                side: const BorderSide(color: Colors.white), // White border
                              ),
                            ),
                            child: Row(
                              children: const [
                                Text('Start', style: TextStyle(color: Colors.black)),
                                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black), // Icon comes after the text
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Previous Curriculum Section
  Widget _buildPreviousCurriculumSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Previous',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Build the previous curriculum cards with exact UI
          _buildPreviousCurriculumCard(
            'Beginners skill training program',
            'Jaya Prakash',
            'assets/images/player_images/Rectangle 161123592 (4).png',
          ),
          const SizedBox(height: 16),
          _buildPreviousCurriculumCard(
            'Beginners skill training program',
            'Jaya Prakash',
            'assets/images/player_images/Rectangle 161123592 (4).png',
          ),
        ],
      ),
    );
  }

  // Build each individual Previous Curriculum Card
  Widget _buildPreviousCurriculumCard(String programName, String coachName, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background for previous cards
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white), // White border
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath, // Replace with the correct image path
          width: 60,
          height: 60,
        ),
        title: Text(programName, style: const TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Text(coachName.substring(0, 2), style: const TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(width: 8),
                Text(coachName, style: const TextStyle(color: Colors.white)), // "Jaya Prakash" text next to avatar
              ],
            ),
            const SizedBox(height: 4),
            const Text('Completed', style: TextStyle(color: Colors.grey)), // "Completed" text below
          ],
        ),
      ),
    );
  }
}

