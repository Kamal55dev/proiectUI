// // ui/match_scoring_screen.dart

// // ignore_for_file: unused_local_variable, file_names

// import 'package:badminton/screens/match_scoring/match_scoring_result/view/match_scoring_result_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../controller/provider/match_scoring_provider.dart';
// import '../../../../core/models/player_models/Match_scoring_model.dart';


// class MatchScoringScreen extends ConsumerWidget {
//   const MatchScoringScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final match = ref.watch(matchProvider);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Match Scoring'),
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildProfileCard(match),
//               const SizedBox(height: 20),
//               const Row(
//                     children: [
//                       Icon(Icons.calendar_month_outlined),
//                       SizedBox(width: 10,),
//                       Text('18 Sep 2024')
//                     ],
//                   ),
//                   const SizedBox(height: 20,),
//               const Text('What kind of match is this?', style: TextStyle(color: Colors.white)),
//               const SizedBox(height: 10),
//               _buildMatchTypeButtons(ref),
//               const SizedBox(height: 20),
//               _buildOpponentField(match),
//               const SizedBox(height: 20),
//               _buildScoreInputFields(ref), // Updated score input fields
//               const SizedBox(height: 20),
//               _buildCommentsField(ref),
//               const SizedBox(height: 20),
//               _buildActionButtons(context, ref), // Pass context here
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Profile Card
//   Widget _buildProfileCard(Match match) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF292B2F),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 24,
//             backgroundImage: AssetImage('assets/images/profile_image/Ellipse 100.png'),
//           ),
//           const SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Lee Chong Wei',
//                 style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   _buildTag('Advance'),
//                   const SizedBox(width: 130),
//                   _buildLocationTag(Icons.location_on, 'Kuala Lumpur'),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Tag widget
//   Widget _buildTag(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       decoration: BoxDecoration(
//         color: const Color(0xFF9254FF),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(color: Colors.white, fontSize: 12),
//       ),
//     );
//   }

//   // Location Tag
//   Widget _buildLocationTag(IconData icon, String text) {
//     return Row(
//       children: [
//         Icon(icon, color: Colors.white54, size: 16),
//         const SizedBox(width: 4),
//         Text(
//           text,
//           style: const TextStyle(color: Colors.white54, fontSize: 12),
//         ),
//       ],
//     );
//   }

//   // Match Type Buttons
//   Widget _buildMatchTypeButtons(WidgetRef ref) {
//     final matchType = ref.watch(matchProvider).matchType;
//     return Row(
//       children: ['Tournament', 'Trial', 'Sparring'].map((type) {
//         return Padding(
//           padding: const EdgeInsets.only(right: 8.0),
//           child: ElevatedButton(
//             onPressed: () => ref.read(matchProvider.notifier).updateMatchType(type),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: matchType == type ? Colors.orange : Colors.grey[800],
//             ),
//             child: Text(type),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // Opponent Field
//   Widget _buildOpponentField(Match match) {
//     return TextField(
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[800],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         hintText: match.opponent,
//         hintStyle: const TextStyle(color: Colors.white54),
//       ),
//       style: const TextStyle(color: Colors.white),
//     );
//   }

// //   // Score Input Fields
// //   // Score Input Fields
// // Widget _buildScoreInputFields(WidgetRef ref) {
// //   final match = ref.watch(matchProvider);

// //   return Column(
// //     children: [
// //       _buildPlayerScoreSection(ref, 0, match.players[0], 'Lee Chong Wei'), // For player 1
// //       const SizedBox(height: 20),
// //       _buildPlayerScoreSection(ref, 1, match.players[1], 'Opponent'), // For player 2
// //     ],
// //   );
// // }

// // // Build Score Section for Player
// // Widget _buildPlayerScoreSection(WidgetRef ref, int playerIndex, Player player, String playerName) {
// //   return Row(
// //     children: [
// //       _buildPlayerInfo(playerName),
// //       const SizedBox(width: 16),
// //       Expanded(
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: List.generate(3, (gameIndex) {
// //             return _buildScoreBox(ref, playerIndex, gameIndex, player.scores[gameIndex]);
// //           }),
// //         ),
// //       ),
// //     ],
// //   );
// // }

// // // Player Info (Avatar and Name)
// // Widget _buildPlayerInfo(String playerName) {
// //   return Row(
// //     children: [
// //       const CircleAvatar(
// //         radius: 24,
// //         backgroundImage: AssetImage('assets/images/profile_image/Ellipse 100.png'),
// //       ),
// //       const SizedBox(width: 8),
// //       Text(
// //         playerName,
// //         style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
// //       ),
// //     ],
// //   );
// // }

// // // Score Box (only this section updated to match the box field from the image)
// // Widget _buildScoreBox(WidgetRef ref, int playerIndex, int gameIndex, int initialValue) {
// //   return SizedBox(
// //     width: 50,  // Square shape
// //     height: 50, // Square shape
// //     child: TextField(
// //       controller: TextEditingController(text: initialValue.toString()),
// //       textAlign: TextAlign.center,
// //       style: const TextStyle(color: Colors.white, fontSize: 18), // Centered, larger font
// //       decoration: InputDecoration(
// //         filled: true,
// //         fillColor: Colors.grey[800],  // Dark background to match the image
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(12), // Rounded corners
// //           borderSide: BorderSide(color: Colors.white54, width: 1), // Visible border
// //         ),
// //       ),
// //       onChanged: (value) {
// //         final score = int.tryParse(value) ?? 0;
// //         ref.read(matchProvider.notifier).updatePlayerScore(playerIndex, gameIndex, score);
// //       },
// //     ),
// //   );
// // }

// // Score Input Fields
// Widget _buildScoreInputFields(WidgetRef ref) {
//   final match = ref.watch(matchProvider);

//   return Column(
//     children: [
//       _buildPlayerScoreSection(ref, 0, match.players[0], 'Lee Chong Wei'), // For player 1
//       const SizedBox(height: 20),
//       _buildPlayerScoreSection(ref, 1, match.players[1], 'Opponent'), // For player 2
//     ],
//   );
// }

// // Build Score Section for Player
// Widget _buildPlayerScoreSection(WidgetRef ref, int playerIndex, Player player, String playerName) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns player info and score boxes
//       children: [
//         _buildPlayerInfo(playerName),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensures even spacing
//             children: List.generate(3, (gameIndex) {
//               return _buildScoreBox(ref, playerIndex, gameIndex, player.scores[gameIndex]);
//             }),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // Player Info (Avatar and Name)
// Widget _buildPlayerInfo(String playerName) {
//   return Row(
//     children: [
//       CircleAvatar(
//         radius: 18, // Smaller avatar to match the UI
//         backgroundColor: playerName == 'Lee Chong Wei' ? Colors.cyanAccent : Colors.pinkAccent,
//         child: Text(
//           playerName == 'Lee Chong Wei' ? 'LC' : 'OP', // Initials for player
//           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       const SizedBox(width: 8),
//       Text(
//         playerName,
//         style: const TextStyle(color: Colors.white, fontSize: 16), // Font size and white text
//       ),
//     ],
//   );
// }

// // Score Box (Unchanged from previous code)
// Widget _buildScoreBox(WidgetRef ref, int playerIndex, int gameIndex, int initialValue) {
//   return SizedBox(
//     width: 50,  // Square shape
//     height: 50, // Square shape
//     child: TextField(
//       controller: TextEditingController(text: initialValue.toString()),
//       textAlign: TextAlign.center,
//       style: const TextStyle(color: Colors.white, fontSize: 18), // Centered, larger font
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[800],  // Dark background to match the image
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12), // Rounded corners
//           borderSide: BorderSide(color: Colors.white54, width: 1), // Visible border
//         ),
//       ),
//       onChanged: (value) {
//         final score = int.tryParse(value) ?? 0;
//         ref.read(matchProvider.notifier).updatePlayerScore(playerIndex, gameIndex, score);
//       },
//     ),
//   );
// }



//   // Comments Field
//   Widget _buildCommentsField(WidgetRef ref) {
//     final match = ref.watch(matchProvider);

//     return TextField(
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[800],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
        
//         hintText: 'Add Comments',
//         hintStyle: const TextStyle(color: Colors.white54),
//       ),
//       style: const TextStyle(color: Colors.white),
//       maxLines: 3,
//       onChanged: (value) => ref.read(matchProvider.notifier).updateComment(value),
//     );
//   }

//   // Action Buttons (Update and Delete)
//   Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const MatchScoringResultScreen()),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color.fromARGB(255, 200, 157, 93),
//             minimumSize: const Size(double.infinity, 50),
//           ),
//           child: const Text('Update'),
//         ),
//         const SizedBox(height: 10),
//         OutlinedButton(
//           onPressed: () => ref.read(matchProvider.notifier).deleteMatch(),
//           style: OutlinedButton.styleFrom(
//             side: const BorderSide(color: Colors.red),
//             minimumSize: const Size(double.infinity, 50),
//           ),
//           child: const Text('Delete this Match', style: TextStyle(color: Colors.red)),
//         ),
//       ],
//     );
//   }
// }



// ui/match_scoring_screen.dart

// ignore_for_file: unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_padding.dart';
import '../../../../common/common_size.dart';
import '../../../../common/common_text.dart';
import '../../../../common/common_text_form_field.dart';
import '../../../../controller/provider/match_scoring_provider.dart';
import '../../../../modules/player_models/Match_scoring_model.dart';
import '../../match_scoring_result/view/match_scoring_result_ui.dart'; // Import common responsive utilities

class MatchScoringScreen extends ConsumerWidget {
  const MatchScoringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const CustomText(text: 'Match Scoring', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: responsivePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(context, match),
              kHeight(context, 0.02),
              const Row(
                children: [
                  Icon(Icons.calendar_month_outlined, color: Colors.white),
                  SizedBox(width: 10),
                  CustomText(text: '18 Sep 2024', color: Colors.white)
                ],
              ),
              kHeight(context, 0.02),
              CustomText(text: 'What kind of match is this?', color: Colors.white),
              kHeight(context, 0.01),
              _buildMatchTypeButtons(ref),
              kHeight(context, 0.02),
              _buildOpponentField(match),
              kHeight(context, 0.02),
              _buildScoreInputFields(context, ref),
              kHeight(context, 0.02),
              _buildCommentsField(ref),
              kHeight(context, 0.02),
              _buildActionButtons(context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(context, Match match) {
    return Container(
      padding: responsivePadding(context),
      decoration: BoxDecoration(
        color: const Color(0xFF292B2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/profile_image/Ellipse 100.png'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Lee Chong Wei',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              kHeight(context, 0.005),
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

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF9254FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomText(
        text: text,
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }

  Widget _buildLocationTag(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 16),
        const SizedBox(width: 4),
        CustomText(
          text: text,
          color: Colors.white54,
          fontSize: 12,
        ),
      ],
    );
  }

  Widget _buildMatchTypeButtons(WidgetRef ref) {
    final matchType = ref.watch(matchProvider).matchType;
    return Row(
      children: ['Tournament', 'Trial', 'Sparring'].map((type) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CustomButton(
            onPress: () => ref.read(matchProvider.notifier).updateMatchType(type),
            backgroundColor: matchType == type ? Colors.orange : Colors.grey[800],
            text: type,
            height: 40,
            width: 100,
            borderRadius: 8,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOpponentField(Match match) {
    return CustomFormField(
      hintText: match.opponent,
      fillColor: Colors.grey[800],
      borderRadius: BorderRadius.circular(10),
      cursorColor: Colors.white,
      textcolor: Colors.white,
      inputType: TextInputType.text,
    );
  }

  Widget _buildScoreInputFields(context, WidgetRef ref) {
    final match = ref.watch(matchProvider);

    return Column(
      children: [
        _buildPlayerScoreSection(ref, 0, match.players[0], 'Lee Chong Wei'),
        kHeight(context, 0.02),
        _buildPlayerScoreSection(ref, 1, match.players[1], 'Opponent'),
      ],
    );
  }

  Widget _buildPlayerScoreSection(WidgetRef ref, int playerIndex, Player player, String playerName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPlayerInfo(playerName),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (gameIndex) {
                return _buildScoreBox(ref, playerIndex, gameIndex, player.scores[gameIndex]);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerInfo(String playerName) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: playerName == 'Lee Chong Wei' ? Colors.cyanAccent : Colors.pinkAccent,
          child: Text(
            playerName == 'Lee Chong Wei' ? 'LC' : 'OP',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8),
        CustomText(
          text: playerName,
          color: Colors.white,
          fontSize: 16,
        ),
      ],
    );
  }

 Widget _buildScoreBox(WidgetRef ref, int playerIndex, int gameIndex, int initialValue) {
  // Create a TextEditingController with initialValue
  final TextEditingController controller = TextEditingController(text: initialValue.toString());

  // Register a listener to the controller to handle text changes
  controller.addListener(() {
    final value = controller.text;
    final score = int.tryParse(value) ?? 0;
    ref.read(matchProvider.notifier).updatePlayerScore(playerIndex, gameIndex, score);
  });

  return SizedBox(
    width: 50,
    height: 50,
    child: CustomFormField(
      controller: controller,  // Pass the controller
      fillColor: Colors.grey[800],
      borderRadius: BorderRadius.circular(12),
      cursorColor: Colors.white,
      textcolor: Colors.white,
      inputType: TextInputType.number,
    ),
  );
}


 Widget _buildCommentsField(WidgetRef ref) {
  final TextEditingController controller = TextEditingController();

  // Register a listener to the controller to handle text changes
  controller.addListener(() {
    final value = controller.text;
    ref.read(matchProvider.notifier).updateComment(value);
  });

  return CustomFormField(
    controller: controller,  // Pass the controller
    hintText: 'Add Comments',
    fillColor: Colors.grey[800],
    borderRadius: BorderRadius.circular(10),
    cursorColor: Colors.white,
    textcolor: Colors.white,
    inputType: TextInputType.text,
    // Assuming CustomFormField can handle multiline text by default or adjust its height if needed
  );
}

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CustomButton(
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MatchScoringResultScreen()),
            );
          },
          backgroundColor: const Color.fromARGB(255, 200, 157, 93),
          text: 'Update',
          height: 50,
          width: double.infinity,
          borderRadius: 8,
          textColor: Colors.white,
        ),
        kHeight(context, 0.01),
        CustomButton(
          onPress: () => ref.read(matchProvider.notifier).deleteMatch(),
          backgroundColor: Colors.transparent,
          borderColor: Colors.red,
          text: 'Delete this Match',
          height: 50,
          width: double.infinity,
          borderRadius: 8,
          textColor: Colors.red,
        ),
      ],
    );
  }
}
