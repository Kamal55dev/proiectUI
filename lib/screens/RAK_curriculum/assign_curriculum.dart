// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../controller/provider/curriculum_provider/assign_curriculum_provider.dart';

// class AssignCurriculumScreen extends ConsumerWidget {
//   const AssignCurriculumScreen({super.key});

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
//           // Header Section (Stack for background images)
//           // SizedBox(
//           //   height: 200, // Specify height for the Stack
//           //   child: Stack(
//           //     children: [
//           //       Positioned.fill(
//           //         child: Image.asset(
//           //           'assets/images/Course Card.png', // Correct asset reference
//           //           fit: BoxFit.cover,
//           //         ),
//           //       ),
//           //       Positioned(
//           //         top: 50,
//           //         left: 16,
//           //         child: Image.asset(
//           //           'assets/images/Looper BG.png', // Another example asset reference
//           //           width: 150,
//           //           height: 150,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),

//           // Curriculum header
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: CurriculumHeader(),
//           ),

//           // Expanded section to hold ListView
//           Expanded(
//             child: CurriculumSections(sections: curriculumData),
//           ),

//           // Bottom delete button
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
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             subject.title,
//             style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         ...subject.exercises.map((exercise) => ExerciseItem(exercise: exercise)).toList(),
//       ],
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
import '../../controller/provider/curriculum_provider/assign_curriculum_provider.dart';

class AssignCurriculumScreen2 extends ConsumerWidget {
  const AssignCurriculumScreen2({super.key});

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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CurriculumHeader(),
          ),
          Expanded(
            child: CurriculumSections(sections: curriculumData),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DeleteButton(onDelete: () {
              // Implement delete logic here
            }),
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '12',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        Text(
          'Aug 2024',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Text(
          'Intermediate',
          style: TextStyle(color: Colors.yellow),
        ),
        Text(
          'Beginners skill training program',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Row(
          children: [
            Text(
              'High Intensity',
              style: TextStyle(color: Colors.white),
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
          const CoachCommentCard(), // Add the CoachCommentCard before Section 2
        ],
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            subject.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...subject.exercises.map((exercise) => ExerciseItem(exercise: exercise)).toList(),
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4, // Width of the vertical line
              height: 50, // Adjust the height of the line as needed
              color: Colors.yellow, // Set the color for the line
            ),
            const SizedBox(width: 16), // Space between the line and the text
            const Expanded(
              child: Text(
                'Some random comments made by the coach on the player’s ability to use this foot better to reach the ball and perform a good smash.',
                style: TextStyle(color: Colors.white),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exercise image
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  exercise.imageUrl, // Use Image.asset for local assets
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Exercise details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          exercise.name,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exercise.description,
                      style: const TextStyle(color: Colors.grey),
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
    return OutlinedButton(
      onPressed: onDelete,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.red),
        minimumSize: const Size(double.infinity, 50), // Button fills width
      ),
      child: const Text(
        'Delete this Match',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
 