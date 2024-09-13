// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../controller/provider/curriculum_provider/assign_curriculum_provider.dart';

// class AssignCurriculumBeginnerSkillTraining extends ConsumerWidget {
//   const AssignCurriculumBeginnerSkillTraining({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final List<Subject> curriculumData = ref.watch(curriculumProvider);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Assign Curriculum'),
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: CurriculumHeader(),
//           ),
//           Expanded(
//             child: CurriculumSections(sections: curriculumData),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: DeleteButton(onDelete: () {
//               // Implement delete logic here
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Curriculum header widget
// class CurriculumHeader extends StatelessWidget {
//   const CurriculumHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '12',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//         ),
//         Text(
//           'Aug 2024',
//           style: TextStyle(color: Colors.grey),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'Intermediate',
//           style: TextStyle(color: Colors.yellow),
//         ),
//         Text(
//           'Beginners skill training program',
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         Row(
//           children: [
//             Text(
//               'High Intensity',
//               style: TextStyle(color: Colors.white),
//             ),
//             Icon(Icons.local_fire_department, color: Colors.red),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // Curriculum sections widget
// class CurriculumSections extends StatelessWidget {
//   final List<Subject> sections;

//   const CurriculumSections({super.key, required this.sections});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: sections.length,
//       itemBuilder: (context, index) {
//         return CurriculumSection(subject: sections[index]);
//       },
//     );
//   }
// }

// // Individual curriculum section widget
// class CurriculumSection extends StatelessWidget {
//   final Subject subject;

//   const CurriculumSection({super.key, required this.subject});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (subject.title == 'Section 2: Hitting Skills') ...[
//           const CoachCommentCard(), // Add the CoachCommentCard before Section 2
//         ],
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             subject.title,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         ...subject.exercises.map((exercise) => ExerciseItem(exercise: exercise)).toList(),
//       ],
//     );
//   }
// }

// // Coach comment card widget
// class CoachCommentCard extends StatelessWidget {
//   const CoachCommentCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.grey[700],
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 4, // Width of the vertical line
//               height: 50, // Adjust the height of the line as needed
//               color: Colors.yellow, // Set the color for the line
//             ),
//             const SizedBox(width: 16), // Space between the line and the text
//             const Expanded(
//               child: Text(
//                 'Some random comments made by the coach on the player’s ability to use this foot better to reach the ball and perform a good smash.',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Exercise item widget
// class ExerciseItem extends StatelessWidget {
//   final Exercise exercise;

//   const ExerciseItem({super.key, required this.exercise});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Exercise image
//               SizedBox(
//                 width: 80,
//                 height: 80,
//                 child: Image.asset(
//                   exercise.imageUrl, // Use Image.asset for local assets
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               // Exercise details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           exercise.name,
//                           style: const TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.arrow_drop_down, color: Colors.white),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       exercise.description,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(color: Colors.white54),
//       ],
//     );
//   }
// }

// // Delete button widget
// class DeleteButton extends StatelessWidget {
//   final VoidCallback onDelete;

//   const DeleteButton({super.key, required this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: onDelete,
//       style: OutlinedButton.styleFrom(
//         side: const BorderSide(color: Colors.red),
//         minimumSize: const Size(double.infinity, 50), // Button fills width
//       ),
//       child: const Text(
//         'Delete this Match',
//         style: TextStyle(color: Colors.red),
//       ),
//     );
//   }
// }
 



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common_button.dart';
import '../../../../common/common_font_size.dart';
import '../../../../common/common_padding.dart';
import '../../../../common/common_size.dart';
import '../../../../common/common_text.dart';
import '../controller/Curriculum_Beginner_Skill_Training.dart';

class AssignCurriculumBeginnerSkillTraining extends ConsumerWidget {
  const AssignCurriculumBeginnerSkillTraining({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Subject> curriculumData = ref.watch(curriculumProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Assign Curriculum'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: responsivePadding(context),
            child: const CurriculumHeader(),
          ),
          Expanded(
            child: CurriculumSections(sections: curriculumData),
          ),
          Padding(
            padding: responsivePadding(context),
            child: DeleteButton(
              onDelete: () {
                // Implement delete logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Curriculum header widget
class CurriculumHeader extends StatelessWidget {
  const CurriculumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '12',
          color: Colors.white,
          fontSize: getResponsiveFontSize(context, 24),
        ),
        CustomText(
          text: 'Aug 2024',
          color: Colors.grey,
          fontSize: getResponsiveFontSize(context, 14),
        ),
        kHeight(context, 0.01),
        CustomText(
          text: 'Intermediate',
          color: Colors.yellow,
          fontSize: getResponsiveFontSize(context, 16),
        ),
        CustomText(
          text: 'Beginners skill training program',
          color: Colors.white,
          fontSize: getResponsiveFontSize(context, 18),
        ),
        Row(
          children: [
            CustomText(
              text: 'High Intensity',
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, 14),
            ),
            Icon(Icons.local_fire_department, color: Colors.red),
          ],
        ),
      ],
    );
  }
}

// Curriculum sections widget
class CurriculumSections extends StatelessWidget {
  final List<Subject> sections;

  const CurriculumSections({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return CurriculumSection(subject: sections[index]);
      },
    );
  }
}

// Individual curriculum section widget
class CurriculumSection extends StatelessWidget {
  final Subject subject;

  const CurriculumSection({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subject.title == 'Section 2: Hitting Skills') ...[
          const CoachCommentCard(),
        ],
        Padding(
          padding: responsivePadding(context),
          child: CustomText(
            text: subject.title,
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, 18),
            fontWeight: FontWeight.bold,
          ),
        ),
        ...subject.exercises
            .map((exercise) => ExerciseItem(exercise: exercise))
            .toList(),
      ],
    );
  }
}

// Coach comment card widget
class CoachCommentCard extends StatelessWidget {
  const CoachCommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[700],
      margin: responsivePadding(context, horizontalFactor: 0.04),
      child: Padding(
        padding: responsivePadding(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.01, // Responsive width
              height: MediaQuery.of(context).size.height * 0.06, // Responsive height
              color: Colors.yellow,
            ),
            kWidth(context, 0.04),
            const Expanded(
              child: CustomText(
                text: 'Some random comments made by the coach on the player’s ability to use this foot better to reach the ball and perform a good smash.',
                color: Colors.white,
                lineHeight: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Exercise item widget
class ExerciseItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseItem({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: responsivePadding(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2, // Responsive width
                height: MediaQuery.of(context).size.width * 0.2, // Keep aspect ratio
                child: Image.asset(
                  exercise.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              kWidth(context, 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: exercise.name,
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(context, 16),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    ),
                    kHeight(context, 0.01),
                    CustomText(
                      text: exercise.description,
                      color: Colors.grey,
                      fontSize: getResponsiveFontSize(context, 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.white54),
      ],
    );
  }
}

// Delete button widget
class DeleteButton extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteButton({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPress: onDelete,
      text: 'Delete this Match',
      textColor: Colors.red,
      backgroundColor: Colors.transparent,
      borderColor: Colors.red,
      height: MediaQuery.of(context).size.height * 0.07, // Responsive height
      width: double.infinity,
      textSize: getResponsiveFontSize(context, 16),
    );
  }
}
