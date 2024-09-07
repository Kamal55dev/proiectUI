// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../controller/provider/curriculum_provider/assign_curriculum_provider.dart';

// class AssignCurriculumScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final List<Subject> curriculumData = ref.watch(curriculumProvider);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('Assign Curriculum'),
//         leading: IconButton(
//           icon: Icon(Icons.close),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header Section (Stack for background images)
//           Stack(
//             children: [
//               Positioned.fill(
//                 child: Image.asset(
//                   'assets/images/Course Card.png', // Correct asset reference
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 50,
//                 left: 16,
//                 child: Image.asset(
//                   'assets/images/Looper BG.png', // Another example asset reference
//                   width: 150,
//                   height: 150,
//                 ),
//               ),
//             ],
//           ),

//           // Curriculum header
//           Padding(
//             padding: const EdgeInsets.all(16.0),
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
//   @override
//   Widget build(BuildContext context) {
//     return Column(
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

//   const CurriculumSections({Key? key, required this.sections}) : super(key: key);

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

//   const CurriculumSection({Key? key, required this.subject}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             subject.title,
//             style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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

//   const ExerciseItem({Key? key, required this.exercise}) : super(key: key);

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
//                 child: Image.network(
//                   exercise.imageUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 16),
//               // Exercise details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           exercise.name,
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         Spacer(),
//                         Icon(Icons.arrow_drop_down, color: Colors.white),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       exercise.description,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(color: Colors.white54),
//       ],
//     );
//   }
// }

// // Delete button widget
// class DeleteButton extends StatelessWidget {
//   final VoidCallback onDelete;

//   const DeleteButton({Key? key, required this.onDelete}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: onDelete,
//       child: Text(
//         'Delete this Match',
//         style: TextStyle(color: Colors.red),
//       ),
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(color: Colors.red),
//         minimumSize: Size(double.infinity, 50), // Button fills width
//       ),
//     );
//   }
// }
