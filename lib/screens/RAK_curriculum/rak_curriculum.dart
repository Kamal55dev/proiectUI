// // ignore_for_file: file_names

// import 'package:badminton/screens/RAK_curriculum/assign_curriculum.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../controller/provider/curriculum_provider/curriculam_provider.dart';
// import '../../core/models/player_models/RAK_curriculum/Curriculam_model.dart';
// import 'assign_curriculam_1/view/assign_curriculam_1_screen.dart';

// class CurriculumPage extends ConsumerWidget {
//   const CurriculumPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subjects = ref.watch(curriculumProvider);

//     return Scaffold(
//       backgroundColor: const Color(0xFF1C1D21),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1C1D21),
//         elevation: 0,
//         leading: const Icon(Icons.arrow_back),
//         title: const Text('Curriculum', style: TextStyle(color: Colors.white)),
//         actions: const [
//           Icon(Icons.menu),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileCard(),

//             const SizedBox(height: 20),

//             const Text(
//               'Player Curriculum',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 20),

//             _buildSkillAssessmentSection(),

//             const SizedBox(height: 20),

//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildSectionHeader('This Month', 'Assign New'),
//                   for (var subject in subjects.where((s) => s.status == 'This Month'))
//                     _buildCurriculumItem(context, subject),
//                   _buildSectionHeader('August 2024', ''),
//                   for (var subject in subjects.where((s) => s.status == 'August 2024'))
//                     _buildCurriculumItem(context, subject),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileCard() {
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
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   _buildTag('Advance'),
//                   const SizedBox(width: 8),
//                   _buildLocationTag(Icons.location_on, 'Kuala Lumpur'),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

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

//   Widget _buildSectionHeader(String title, String action) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 12.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         if (action.isNotEmpty)
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AssignCurriculumPage(), // Navigate to the AssignCurriculumPage
//                 ),
//               );
//             },
//             child: Text(
//               action,
//               style: const TextStyle(
//                 color: Color(0xFFEA4C89),
//                 fontSize: 14,
//               ),
//             ),
//           ),
//       ],
//     ),
//   );
// }


//   Widget _buildCurriculumItem(BuildContext context, Subject subject) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF292B2F),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 subject.date,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 subject.monthYear,
//                 style: const TextStyle(color: Colors.white54, fontSize: 14),
//               ),
//             ],
//           ),
//           const SizedBox(width: 8),
//           Container(
//             width: 1,
//             height: 40,
//             color: Colors.white54,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   subject.title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 12,
//                       backgroundImage: AssetImage('assets/images/profile_image/Frame 2085661773.png'),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       subject.name,
//                       style: const TextStyle(color: Colors.white54, fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 22,
//             height: 22,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               border: Border.all(
//                 color: Colors.white,
//                 width: 2,
//               ),
//             ),
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>  AssignCurriculumScreen2(),
//                   ),
//                 );
//               },
//               icon: const Icon(
//                 Icons.arrow_forward,
//                 color: Colors.white,
//                 size: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSkillAssessmentSection() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Stack(
//         children: [
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: 170,
//               width: 170,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: RadialGradient(
//                   colors: [
//                     Colors.orange.withOpacity(0.30),
//                     Colors.transparent,
//                   ],
//                   stops: const [0.5, 1],
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 50),
//                   Text(
//                     'Player\nCurriculum',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                 ],
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Image.asset(
//                     'assets/images/player_images/mail-dynamic-premium.png',
//                     height: 145,
//                     width: 145,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/provider/curriculum_provider/curriculam_provider.dart';
import '../../core/models/player_models/RAK_curriculum/Curriculam_model.dart';
import 'assign_curriculam_1/view/assign_curriculam_1_screen.dart';

class CurriculumPage extends ConsumerWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(curriculumProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1D21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1D21),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Curriculum', style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.menu),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),

            const SizedBox(height: 20),

            const Text(
              'Player Curriculum',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _buildSkillAssessmentSection(),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _buildSectionHeader(context, 'This Month', 'Assign New'), // Pass context
                  for (var subject in subjects.where((s) => s.status == 'This Month'))
                    _buildCurriculumItem(context, subject),
                  _buildSectionHeader(context, 'August 2024', ''), // Pass context
                  for (var subject in subjects.where((s) => s.status == 'August 2024'))
                    _buildCurriculumItem(context, subject),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
              const Text(
                'Lee Chong Wei',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildTag('Advance'),
                  const SizedBox(width: 8),
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
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildLocationTag(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (action.isNotEmpty)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignCurriculumPage(), // Navigate to the AssignCurriculumPage
                  ),
                );
              },
              child: Text(
                action,
                style: const TextStyle(color: Color(0xFFEA4C89), fontSize: 14),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCurriculumItem(BuildContext context, Subject subject) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF292B2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject.date,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subject.monthYear,
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 40,
            color: Colors.white54,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/images/profile_image/Frame 2085661773.png'),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      subject.name,
                      style: const TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssignCurriculumPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillAssessmentSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.orange.withOpacity(0.30),
                    Colors.transparent,
                  ],
                  stops: const [0.5, 1],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Player\nCurriculum',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/player_images/mail-dynamic-premium.png',
                    height: 145,
                    width: 145,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
