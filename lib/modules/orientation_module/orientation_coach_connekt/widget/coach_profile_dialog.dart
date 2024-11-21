// import 'package:badminton/modules/orientation_module/orientation_coach_connekt/widget/available_coaches_gridview.dart';
// import 'package:flutter/material.dart';
// import 'package:badminton/common/common_font_size.dart';
// import 'package:badminton/common/common_text.dart';

// class CoachProfileDialog extends StatelessWidget {
//   final CoachData coach;
//   final VoidCallback onClose;

//   const CoachProfileDialog({
//     Key? key,
//     required this.coach,
//     required this.onClose,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: [
//           Container(
//             height: size.height * 0.5,
//             width: size.width * 0.8,
//             padding: EdgeInsets.all(size.width * 0.04),
//             decoration: BoxDecoration(
//               color: const Color(0xFF292B2F),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 2),
//                   ),
//                   child: CircleAvatar(
//                     radius: size.width * 0.15,
//                     backgroundImage: AssetImage(coach.imageUrl),
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.02),
//                 CustomText(
//                   text: coach.name,
//                   fontSize: getResponsiveFontSize(context, 20),
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 SizedBox(height: size.height * 0.01),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/location_icon.png',
//                       width: size.width * 0.05,
//                       height: size.width * 0.05,
//                     ),
//                     SizedBox(width: size.width * 0.02),
//                     Text(
//                       coach.location,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: getResponsiveFontSize(context, 14),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: size.height * 0.03),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle send request
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.amber,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: size.width * 0.08,
//                       vertical: size.height * 0.015,
//                     ),
//                   ),
//                   child: Text(
//                     'Send Request',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: getResponsiveFontSize(context, 16),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: -size.height * 0.02,
//             right: -size.width * 0.02,
//             child: GestureDetector(
//               onTap: onClose,
//               child: Container(
//                 padding: EdgeInsets.all(size.width * 0.01),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.close,
//                   size: size.width * 0.06,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
