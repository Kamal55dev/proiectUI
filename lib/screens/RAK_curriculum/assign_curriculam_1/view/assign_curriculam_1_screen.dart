// import 'package:badminton/screens/RAK_curriculum/assign_curriculam_1/controller/assign_curriculam_1_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AssignCurriculumPage extends ConsumerStatefulWidget {
//   const AssignCurriculumPage({Key? key}) : super(key: key);

//   @override
//   _AssignCurriculumPageState createState() => _AssignCurriculumPageState();
// }

// class _AssignCurriculumPageState extends ConsumerState<AssignCurriculumPage> {
//   bool isUpdateButtonEnabled = false; // Track if the button is enabled

//   @override
//   Widget build(BuildContext context) {
//     final technicalSkills = ref.watch(technicalSkillsProvider);
//     final hittingSkills = ref.watch(hittingSkillsProvider);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Assign Curriculum', style: TextStyle(color: Colors.white)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {},
//         ),
//       ),
//       body: SingleChildScrollView(
//         child:  
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileCard(), // Updated profile card
//             const SizedBox(height: 20),
//             _buildSectionTitle('Section 1: Technical Skills'),
//             const SizedBox(height: 10),
//             _buildSkillList(technicalSkills, ref, technicalSkillsProvider, [
//               'Split - Step',
//               'Running Steps',
//               'Chasse',
//               'Cross - behind',
//               'Hop / Pivot',
//               'Lunge',
//               'Jump',
//               'Landing',
//             ]),
//             const Divider(color: Colors.grey), // Divider between sections
//             const SizedBox(height: 20),
//             _buildSectionTitle('Section 2: Hitting Skills'),
//             const SizedBox(height: 10),
//             _buildSkillList(hittingSkills, ref, hittingSkillsProvider, [
//               'Backhand Serve',
//               'Backhand forecourt strokes',
//               'Forehand forecourt strokes',
//               'Forehand high serves',
//               'Backhand midcourt strokes',
//               'Forehand midcourt strokes',
//               'Forehand overheads',
//             ]),
//             const SizedBox(height: 20),
//             _buildUpdateButton(), // Update button with enabled/disabled state
//           ],
//         ),
//       ),
//       )
//     );
//   }

//   // Updated profile card with vertical line and location tag adjustment
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
//                   // Adjusting location tag alignment
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

//   // New skill list with dividers and vertical line on the left
//   Widget _buildSkillList(List<bool> skills, WidgetRef ref, StateProvider<List<bool>> provider, List<String> titles) {
//   // Ensuring the number of skills matches the number of titles
//   final int itemCount = titles.length < skills.length ? titles.length : skills.length;

//   return Column(
//     children: List.generate(itemCount, (index) {
//       return Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 4,
//                 height: 40,
//                 color: Colors.white54,
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: ListTile(
//                   title: Text(titles[index], style: const TextStyle(color: Colors.white)),
//                   trailing: IconButton(
//                     icon: Icon(
//                       skills[index] ? Icons.check_circle : Icons.circle_outlined,
//                       color: skills[index] ? Colors.yellow : Colors.grey,
//                     ),
//                     onPressed: () {
//                       // Toggle the state of the skill
//                       ref.read(provider.notifier).update((state) {
//                         List<bool> updatedSkills = List.from(state);
//                         updatedSkills[index] = !updatedSkills[index];

//                         // Enable the update button if any skill is selected
//                         setState(() {
//                           isUpdateButtonEnabled = updatedSkills.contains(true);
//                         });

//                         return updatedSkills;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Divider between each skill
//           if (index < itemCount - 1) const Divider(color: Colors.grey),
//         ],
//       );
//     }),
//   );
// }


//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//     );
//   }

//   // Update button with conditional enabled/disabled state
//   Widget _buildUpdateButton() {
//     return Center(
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isUpdateButtonEnabled ? Colors.yellow : Colors.grey, // Dynamic button color
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//         ),
//         onPressed: isUpdateButtonEnabled
//             ? () {
//                 // Handle update logic here
//               }
//             : null, // Disable button when no skill is selected
//         child: const Text('Update', style: TextStyle(color: Colors.black, fontSize: 16)),
//       ),
//     );
//   }
// }



// ignore_for_file: library_private_types_in_public_api

import 'package:badminton/screens/RAK_curriculum/assign_curriculam_1/controller/assign_curriculam_1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_padding.dart';
import '../../../../common/common_size.dart';
import '../../../../common/common_text.dart';

class AssignCurriculumPage extends ConsumerStatefulWidget {
  const AssignCurriculumPage({super.key});

  @override
  _AssignCurriculumPageState createState() => _AssignCurriculumPageState();
}

class _AssignCurriculumPageState extends ConsumerState<AssignCurriculumPage> {
  bool isUpdateButtonEnabled = false; // Track if the button is enabled

  @override
  Widget build(BuildContext context) {
    final technicalSkills = ref.watch(technicalSkillsProvider);
    final hittingSkills = ref.watch(hittingSkillsProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const CustomText(
          text: 'Assign Curriculum',
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: responsivePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(), // Updated profile card
              kHeight(context, 0.02),
              _buildSectionTitle('Section 1: Technical Skills'),
              kHeight(context, 0.01),
              _buildSkillList(technicalSkills, ref, technicalSkillsProvider, [
                'Split - Step',
                'Running Steps',
                'Chasse',
                'Cross - behind',
                'Hop / Pivot',
                'Lunge',
                'Jump',
                'Landing',
              ]),
              const Divider(color: Colors.grey), // Divider between sections
              kHeight(context, 0.02),
              _buildSectionTitle('Section 2: Hitting Skills'),
              kHeight(context, 0.01),
              _buildSkillList(hittingSkills, ref, hittingSkillsProvider, [
                'Backhand Serve',
                'Backhand forecourt strokes',
                'Forehand forecourt strokes',
                'Forehand high serves',
                'Backhand midcourt strokes',
                'Forehand midcourt strokes',
                'Forehand overheads',
              ]),
              kHeight(context, 0.02),
              _buildUpdateButton(), // Update button with enabled/disabled state
            ],
          ),
        ),
      ),
    );
  }

  // Updated profile card with vertical line and location tag adjustment
  Widget _buildProfileCard() {
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
          kWidth(context, 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Lee Chong Wei',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              kHeight(context, 0.01),
              Row(
                children: [
                  _buildTag('Advance'),
                  kWidth(context, 0.02),
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
        kWidth(context, 0.01),
        CustomText(
          text: text,
          color: Colors.white54,
          fontSize: 12,
        ),
      ],
    );
  }

  // New skill list with dividers and vertical line on the left
  Widget _buildSkillList(List<bool> skills, WidgetRef ref, StateProvider<List<bool>> provider, List<String> titles) {
    final int itemCount = titles.length < skills.length ? titles.length : skills.length;

    return Column(
      children: List.generate(itemCount, (index) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  color: Colors.white54,
                ),
                kWidth(context, 0.02),
                Expanded(
                  child: ListTile(
                    title: CustomText(
                      text: titles[index],
                      color: Colors.white,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        skills[index] ? Icons.check_circle : Icons.circle_outlined,
                        color: skills[index] ? Colors.yellow : Colors.grey,
                      ),
                      onPressed: () {
                        // Toggle the state of the skill
                        ref.read(provider.notifier).update((state) {
                          List<bool> updatedSkills = List.from(state);
                          updatedSkills[index] = !updatedSkills[index];

                          // Enable the update button if any skill is selected
                          setState(() {
                            isUpdateButtonEnabled = updatedSkills.contains(true);
                          });

                          return updatedSkills;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Divider between each skill
            if (index < itemCount - 1) const Divider(color: Colors.grey),
          ],
        );
      }),
    );
  }

  Widget _buildSectionTitle(String title) {
    return CustomText(
      text: title,
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  // Update button with conditional enabled/disabled state
  Widget _buildUpdateButton() {
    return Center(
      child: CustomButton(
        backgroundColor: isUpdateButtonEnabled ? Colors.yellow : Colors.grey,
        textColor: Colors.black,
        text: 'Update',
        isLoading: false,
        onPress: isUpdateButtonEnabled
            ? () {
                // Handle update logic here
              }
            : null, // Disable button when no skill is selected
      ),
    );
  }
}
