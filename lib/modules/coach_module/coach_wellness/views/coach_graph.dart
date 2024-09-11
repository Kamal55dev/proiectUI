// import 'package:badminton/common/common_text.dart';
// import 'package:badminton/core/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class CoachGraphScreen extends StatefulWidget {
//   const CoachGraphScreen({super.key});

//   @override
//   State<CoachGraphScreen> createState() => _CoachGraphScreenState();
// }

// class _CoachGraphScreenState extends State<CoachGraphScreen> {
//   late ZoomPanBehavior _zoomPanBehavior;

//   @override
//   void initState() {
//     _zoomPanBehavior = ZoomPanBehavior(
//       enablePinching: true,
//       zoomMode: ZoomMode.x,
//       enablePanning: true,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         title: const CustomText(
//           text: 'Graph',
//           color: white,
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             child: SfCartesianChart(
//                 primaryXAxis: NumericAxis(
//                     interactiveTooltip: InteractiveTooltip(
//                         // Displays the x-axis tooltip
//                         enable: true,
//                         borderColor: Colors.red,
//                         borderWidth: 2)),
//                 primaryYAxis: NumericAxis(
//                     interactiveTooltip: InteractiveTooltip(
//                         // Displays the y-axis tooltip
//                         enable: true,
//                         borderColor: Colors.red,
//                         borderWidth: 2)),
//                 zoomPanBehavior: _zoomPanBehavior),
//           )
//         ],
//       ),
//     ));
//   }
// }
