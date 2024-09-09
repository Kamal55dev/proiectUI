import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final tabIndexProvider = StateProvider<int>((ref) => 0);

// class CoachRequestorListScreen extends ConsumerWidget {
//   const CoachRequestorListScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedIndex = ref.watch(tabIndexProvider);

//     return SafeArea(
//       child: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           backgroundColor: backgroundColor,
//           body: Column(
//             children: [
//               // TabBar is now placed inside the body and is scrollable
//               TabBar(
//                 isScrollable: true,
//                 automaticIndicatorColorAdjustment: true,
//                 dragStartBehavior: DragStartBehavior.start,
//                 labelPadding: responsiveSidePadding(context, leftFactor: 0.01),
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.transparent,
//                 ),
//                 tabAlignment: TabAlignment.start,
//                 unselectedLabelColor: primaryColor,
//                 tabs: [
//                   _buildTab(context, "Assigned", 0, selectedIndex),
//                   _buildTab(context, "Approved", 1, selectedIndex),
//                   _buildTab(context, "Rejected", 2, selectedIndex),
//                   _buildTab(context, "Trials", 3, selectedIndex),
//                 ],
//                 onTap: (index) {
//                   ref.read(tabIndexProvider.notifier).state = index;
//                 },
//               ),
//               const Expanded(
//                 child: TabBarView(
//                   physics: NeverScrollableScrollPhysics(),
//                   children: [
//                     // CoachAssignedScreen(),
//                     // CoachApprovedScreen(),
//                     // CoachRejectedScreen(),
//                     // CoachTrialsScreen(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTab(
//       BuildContext context, String text, int index, int selectedIndex) {
//     return Tab(
//       child: Container(
//         padding: responsivePadding(context,
//             horizontalFactor: 0.05, verticalFactor: 0.015),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: selectedIndex == index ? primaryColor : black,
//           border: Border.all(color: grey),
//         ),
//         child: CustomText(
//           text: text,
//           fontSize: getResponsiveFontSize(context, 12),
//           color: selectedIndex == index ? white : primaryColor,
//         ),
//       ),
//     );
//   }
// }
// final tabIndexProvider = StateProvider<int>((ref) => 0);

// class CustomTabBar extends ConsumerWidget {
//   const CustomTabBar({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedIndex = ref.watch(tabIndexProvider);

//     return Column(
//       children: [
//         // Scrollable TabBar
//         TabBar(
//           isScrollable: true,
//           automaticIndicatorColorAdjustment: true,
//           dragStartBehavior: DragStartBehavior.start,
//           labelPadding: responsiveSidePadding(context, leftFactor: 0.01),
//           indicator: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.transparent,
//           ),
//           tabAlignment: TabAlignment.start,
//           unselectedLabelColor: primaryColor,
//           tabs: [
//             _buildTab(context, "Assigned", 0, selectedIndex),
//             _buildTab(context, "Approved", 1, selectedIndex),
//             _buildTab(context, "Rejected", 2, selectedIndex),
//             _buildTab(context, "Trials", 3, selectedIndex),
//           ],
//           onTap: (index) {
//             ref.read(tabIndexProvider.notifier).state = index;
//           },
//         ),
//         // Expanded TabBarView for each tab's content
//         const Expanded(
//           child: TabBarView(
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               // CoachAssignedScreen(),
//               // CoachApprovedScreen(),
//               // CoachRejectedScreen(),
//               // CoachTrialsScreen(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Function to build individual tabs
//   Widget _buildTab(
//       BuildContext context, String text, int index, int selectedIndex) {
//     return Tab(
//       child: Container(
//         padding: responsivePadding(context,
//             horizontalFactor: 0.05, verticalFactor: 0.015),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: selectedIndex == index ? primaryColor : black,
//           border: Border.all(color: grey),
//         ),
//         child: CustomText(
//           text: text,
//           fontSize: getResponsiveFontSize(context, 12),
//           color: selectedIndex == index ? white : primaryColor,
//         ),
//       ),
//     );
//   }
// }
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);

class CustomTabBar extends ConsumerWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider);

    return Column(
      children: [
        // Scrollable TabBar
        TabBar(
          isScrollable: true,
          automaticIndicatorColorAdjustment: true,
          dragStartBehavior: DragStartBehavior.start,
          labelPadding: responsiveSidePadding(context, leftFactor: 0.01),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          tabAlignment: TabAlignment.start,
          unselectedLabelColor: primaryColor,
          tabs: [
            _buildTab(context, "Assigned", 0, selectedIndex),
            _buildTab(context, "Approved", 1, selectedIndex),
            _buildTab(context, "Rejected", 2, selectedIndex),
            _buildTab(context, "Trials", 3, selectedIndex),
          ],
          onTap: (index) {
            ref.read(tabIndexProvider.notifier).state = index;
          },
        ),
        // Expanded TabBarView for each tab's content
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(child: Text('Assigned Screen')),
              Center(child: Text('Approved Screen')),
              Center(child: Text('Rejected Screen')),
              Center(child: Text('Trials Screen')),
            ],
          ),
        ),
      ],
    );
  }

  // Function to build individual tabs
  Widget _buildTab(
      BuildContext context, String text, int index, int selectedIndex) {
    return Tab(
      child: Container(
        padding: responsivePadding(context,
            horizontalFactor: 0.05, verticalFactor: 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedIndex == index ? primaryColor : black,
          border: Border.all(color: grey),
        ),
        child: CustomText(
          text: text,
          fontSize: getResponsiveFontSize(context, 12),
          color: selectedIndex == index ? white : primaryColor,
        ),
      ),
    );
  }
}
