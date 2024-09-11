// import 'package:flutter/material.dart';

// class MatchScoringResultScreen extends StatelessWidget {
//   const MatchScoringResultScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Background image
//             Positioned.fill(
//               child: Opacity(
//                 opacity: 0.6,
//                 child: Image.asset(
//                   'assets/images/bg_images/Looper BG (2).png', // Background image of player
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 500,
//               left: 160,
//               child: Opacity(
//                 opacity: 0.2,
//                 child: Image.asset(
//                   'assets/images/player_images/Layer_1.png', // Background image of player
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 _buildHeader(),
//                 Expanded(child: _buildContent()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return const Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Match Scoring',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Icon(Icons.close, color: Colors.white),
//         ],
//       ),
//     );
//   }

//   Widget _buildContent() {
//     return  Column(
//         children: [
//           _buildDateAndTime(),
//           _buildVersusSection(),
//           _buildScores(),
//           // const Spacer(),
//           const SizedBox(height: 165,),
//           _buildFooter(),
//           const SizedBox(height: 20),
//         ],
//       );
//   }

//   Widget _buildDateAndTime() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child:Text('24 Jun 2024', style: TextStyle(color: Colors.white)), 
//               ),
              
//               //SizedBox(width: 100,),
//               // Icon(Icons.edit_square)
//             ],
//           ),
          
//          const SizedBox(height: 15),
//               const Text('10:30 am', style: TextStyle(color: Colors.white)),
//               const SizedBox(height: 10),
//               Text('Sparring', style: TextStyle(color: Colors.green[400])),
//               // SizedBox(width: 8),
//               // Icon(Icons.edit, color: Colors.green, size: 16),
//         ],
//       ),
//     );
//   }

//   Widget _buildVersusSection() {
//     return const Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           // Player 1 image
//           Column(
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage('assets/images/profile_image/Ellipse 954.png'),
//               ),
//               SizedBox(height: 8),
//               Icon(Icons.emoji_events, color: Colors.yellow, size: 24),
//             ],
//           ),
//           Text('VS', style: TextStyle(color: Colors.white, fontSize: 24)),
//           // Player 2 initials
//           CircleAvatar(
//             radius: 40,
//             backgroundColor: Colors.white,
//             child: Text('MK', style: TextStyle(color: Colors.black, fontSize: 24)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScores() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24.0),
//       child: Column(
//         children: [
//           _buildScoreRow('Game 1', '21', '18'),
//           _buildScoreRow('Game 2', '18', '21'),
//           _buildScoreRow('Game 3', '21', '12'),
//         ],
//       ),
//     );
//   }

//   Widget _buildScoreRow(String game, String score1, String score2) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text(score1, style: const TextStyle(color: Colors.white, fontSize: 20)),
//           Text(game, style: const TextStyle(color: Colors.grey, fontSize: 16)),
//           Text(score2, style: const TextStyle(color: Colors.white, fontSize: 20)),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooter() {
//     return Column(
//       children: [
//         const Text(
//           'This game is created by the coach',
//           style: TextStyle(color: Colors.grey, fontSize: 12),
//         ),
//         const SizedBox(height: 16),
//         ElevatedButton.icon(
//           icon: const Icon(Icons.share, color: Colors.black),
//           label: const Text('Share it with your friends',
//               style: TextStyle(color: Colors.black)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20)),
//           ),
//           onPressed: () {
//             // Add your sharing functionality here
//           },
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';

import '../../../../common/common_button.dart';
import '../../../../common/common_font_size.dart';
import '../../../../common/common_padding.dart';
import '../../../../common/common_size.dart';
import '../../../../common/common_text.dart';

// Assuming all your common widgets are imported properly here

class MatchScoringResultScreen extends StatelessWidget {
  const MatchScoringResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  'assets/images/bg_images/Looper BG (2).png', // Background image of player
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.65,
              left: MediaQuery.of(context).size.width * 0.42,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/player_images/Layer_1.png', // Background image of player
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                _buildHeader(context),
                Expanded(child: _buildContent(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: responsivePadding(context, verticalFactor: 0.015, horizontalFactor: 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Match Scoring',
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
          Icon(Icons.close, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        _buildDateAndTime(context),
        _buildVersusSection(context),
        _buildScores(context),
        kHeight(context, 0.2), // Responsive height spacer
        _buildFooter(context),
        kHeight(context, 0.03),
      ],
    );
  }

  Widget _buildDateAndTime(BuildContext context) {
    return Padding(
      padding: responsivePadding(context, verticalFactor: 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: '24 Jun 2024',
                color: Colors.white,
                fontSize: getResponsiveFontSize(context, 14),
              ),
            ],
          ),
          kHeight(context, 0.02),
          CustomText(
            text: '10:30 am',
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, 14),
          ),
          kHeight(context, 0.01),
          CustomText(
            text: 'Sparring',
            color: Colors.green[400],
            fontSize: getResponsiveFontSize(context, 14),
          ),
        ],
      ),
    );
  }

  Widget _buildVersusSection(BuildContext context) {
    return Padding(
      padding: responsivePadding(context, verticalFactor: 0.02, horizontalFactor: 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Player 1 image
          Column(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.1,
                backgroundImage: AssetImage('assets/images/profile_image/Ellipse 954.png'),
              ),
              kHeight(context, 0.01),
              Icon(Icons.emoji_events, color: Colors.yellow, size: getResponsiveFontSize(context, 24)),
            ],
          ),
          CustomText(
            text: 'VS',
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, 24),
          ),
          // Player 2 initials
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.1,
            backgroundColor: Colors.white,
            child: CustomText(
              text: 'MK',
              color: Colors.black,
              fontSize: getResponsiveFontSize(context, 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScores(BuildContext context) {
    return Padding(
      padding: responsivePadding(context, verticalFactor: 0.03),
      child: Column(
        children: [
          _buildScoreRow(context, 'Game 1', '21', '18'),
          _buildScoreRow(context, 'Game 2', '18', '21'),
          _buildScoreRow(context, 'Game 3', '21', '12'),
        ],
      ),
    );
  }

  Widget _buildScoreRow(BuildContext context, String game, String score1, String score2) {
    return Padding(
      padding: responsivePadding(context, verticalFactor: 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            text: score1,
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, 20),
          ),
          CustomText(
            text: game,
            color: Colors.grey,
            fontSize: getResponsiveFontSize(context, 16),
          ),
          CustomText(
            text: score2,
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, 20),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'This game is created by the coach',
          color: Colors.grey,
          fontSize: getResponsiveFontSize(context, 12),
        ),
        kHeight(context, 0.02),
        CustomButton(
          text: 'Share it with your friends',
          textColor: Colors.black,
          backgroundColor: Colors.white,
          borderRadius: 20.0,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          onPress: () {
            // Share functionality
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share, color: Colors.black),
              kWidth(context, 0.02),
              CustomText(
                text: 'Share it with your friends',
                color: Colors.black,
                fontSize: getResponsiveFontSize(context, 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
