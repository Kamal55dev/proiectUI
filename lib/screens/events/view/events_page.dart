// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../common/common_padding.dart';

// class ScheduleWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {Navigator.of(context).pop();},
//         ),
//         title: Text('Schedules'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: responsiveAllPadding(context, 0.03),
//         child: Column(
//           children: [
//             _CalendarWidget(),
//             _buildEventsList(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildEventsList() {
//     return Expanded(
//       child: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           _buildDateHeader('Today • 14 January 2024'),
//           _buildEventItem('8:30 AM', '45 Min', 'Fitness Training: Team Under 18',
//               'National Sports Stadium, Dhaka', Colors.blue),
//           Divider(color: Colors.grey[800]),
//           _buildEventItem('9:00 AM', '30 Min', 'Team Meeting: High Performance',
//               'National Sports Stadium, Dhaka', Colors.green),
//           Divider(color: Colors.grey[800]),
//           _buildEventItem('10:00 AM', '30 Min', 'Sparring Time: Boys Morning B..',
//               'National Sports Stadium, Dhaka', Colors.purple),
//           Divider(color: Colors.grey[800]),
//           _buildEventItem('5:00 PM', '30 Min', 'Tournament: Regional Qualif...',
//               'National Sports Stadium, Dhaka', Colors.orange),
//           SizedBox(height: 16),
//           _buildDateHeader('15 January 2024'),
//           _buildNoEventsPlanned(),
//           Divider(color: Colors.grey[800]),
//           SizedBox(height: 16),
//           _buildDateHeader('16 January 2024'),
//           _buildEventItem('10:00 AM', '30 Min', 'Sparring Time: Boys Morning B..',
//               'National Sports Stadium, Dhaka', Colors.purple),
//           Divider(color: Colors.grey[800]),
//         ],
//       ),
//     );
//   }

//   Widget _buildDateHeader(String date) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Text(
//         date,
//         style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildEventItem(String time, String duration, String title,
//       String location, Color color) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(time, style: TextStyle(color: Colors.white)),
//               Text(duration, style: TextStyle(color: Colors.grey, fontSize: 12)),
//             ],
//           ),
//           SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: color,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         title,
//                         style: TextStyle(color: Colors.white),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.location_on, color: Colors.grey, size: 16),
//                     SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         location,
//                         style: TextStyle(color: Colors.grey, fontSize: 12),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNoEventsPlanned() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Container(
//             width: 10,
//             height: 10,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(width: 8),
//           Text('No Events Planned', style: TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }
// }

// class _CalendarWidget extends StatefulWidget {
//   @override
//   __CalendarWidgetState createState() => __CalendarWidgetState();
// }

// class __CalendarWidgetState extends State<_CalendarWidget> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       padding: EdgeInsets.all(16),
//       color: Colors.grey[900],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'January 2024',
//                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                 icon: Icon(
//                   _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isExpanded = !_isExpanded;
//                   });
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
//                 .map((day) => Text(day, style: TextStyle(color: Colors.grey)))
//                 .toList(),
//           ),
//           SizedBox(height: 8),
//           // This displays dates in the first week
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(7, (index) {
//               return Text(
//                 '${index + 1}',
//                 style: TextStyle(color: Colors.white),
//               );
//             }),
//           ),
//           SizedBox(height: 4),
//           // This displays dots for dates with events in the first week
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(7, (index) {
//               List<Color> dotColors = [];
//               if (index == 0) dotColors = [Colors.red, Colors.purple, Colors.green];
//               if (index == 4) dotColors = [Colors.purple, Colors.green, Colors.orange];
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: dotColors
//                     .map((color) => Container(
//                           width: 4,
//                           height: 4,
//                           margin: EdgeInsets.symmetric(horizontal: 1),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: color,
//                           ),
//                         ))
//                     .toList(),
//               );
//             }),
//           ),
//           // Show all dates if expanded
//           _isExpanded
//               ? Column(
//                   children: List.generate(5, (weekIndex) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(7, (dayIndex) {
//                         int day = weekIndex * 7 + dayIndex + 1;
//                         return Expanded(
//                           child: Center(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   '$day',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 if (_hasEventForDay(day))
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 4.0),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: _getDotsForDay(day),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     );
//                   }),
//                 )
//               : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }

//   bool _hasEventForDay(int day) {
//     // Determine if the day has events based on your criteria
//     return day == 1 || day == 7 || day == 14 || day == 24;
//   }

//   List<Widget> _getDotsForDay(int day) {
//     // Return dots based on the day (simplified logic for example)
//     if (day == 1) return [
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle)),
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle))
//     ];
//     if (day == 7) return [
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle))
//     ];
//     if (day == 14) return [
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle)),
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle))
//     ];
//     if (day == 24) return [
//       Container(width: 4, height: 4, decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle))
//     ];
//     return [];
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/common_padding.dart';
import '../../../common/common_text.dart';
import '../../../common/common_size.dart';

class ScheduleWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Schedules',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false, // Disable default back button
        actions: [
          IconButton(
            icon: Image.asset('assets/images/icon_images/Action Icons.png'), // Use your custom action image here
            onPressed: () {
              // Add the action you want to trigger when the image is pressed
            },
          ),
        ],
      ),
      body: Padding(
        padding: responsiveAllPadding(context, 0.03),
        child: Column(
          children: [
            _CalendarWidget(),
            _buildEventsList(context), // Pass context for responsive widgets
          ],
        ),
      ),
    );
  }

  Widget _buildEventsList(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildDateHeader(context, 'Today • 14 January 2024'),
          _buildEventItem(
            context, 
            '8:30 AM', 
            '45 Min', 
            'Fitness Training: Team Under 18', 
            'National Sports Stadium, Dhaka', 
            Colors.blue
          ),
          Divider(color: Colors.grey[800]),
          _buildEventItem(
            context, 
            '9:00 AM', 
            '30 Min', 
            'Team Meeting: High Performance', 
            'National Sports Stadium, Dhaka', 
            Colors.green
          ),
          Divider(color: Colors.grey[800]),
          _buildEventItem(
            context, 
            '10:00 AM', 
            '30 Min', 
            'Sparring Time: Boys Morning B..', 
            'National Sports Stadium, Dhaka', 
            Colors.purple
          ),
          Divider(color: Colors.grey[800]),
          _buildEventItem(
            context, 
            '5:00 PM', 
            '30 Min', 
            'Tournament: Regional Qualif...', 
            'National Sports Stadium, Dhaka', 
            Colors.orange
          ),
          kHeight(context, 0.02),
          _buildDateHeader(context, '15 January 2024'),
          _buildNoEventsPlanned(context),
          Divider(color: Colors.grey[800]),
          kHeight(context, 0.02),
          _buildDateHeader(context, '16 January 2024'),
          _buildEventItem(
            context, 
            '10:00 AM', 
            '30 Min', 
            'Sparring Time: Boys Morning B..', 
            'National Sports Stadium, Dhaka', 
            Colors.purple
          ),
          Divider(color: Colors.grey[800]),
        ],
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context, String date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: CustomText(
        text: date,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, String time, String duration, String title, String location, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: time, color: Colors.white),
              CustomText(text: duration, color: Colors.grey, fontSize: 12),
            ],
          ),
          kWidth(context, 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                    ),
                    kWidth(context, 0.02),
                    Expanded(
                      child: CustomText(
                        text: title,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 16),
                    kWidth(context, 0.01),
                    Expanded(
                      child: CustomText(
                        text: location,
                        color: Colors.grey,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoEventsPlanned(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          kWidth(context, 0.02),
          CustomText(text: 'No Events Planned', color: Colors.grey),
        ],
      ),
    );
  }
}

class _CalendarWidget extends StatefulWidget {
  @override
  __CalendarWidgetState createState() => __CalendarWidgetState();
}

class __CalendarWidgetState extends State<_CalendarWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(16),
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'January 2024',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                icon: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                .map((day) => CustomText(text: day, color: Colors.grey))
                .toList(),
          ),
          SizedBox(height: 8),
          // This displays dates in the first week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return CustomText(
                text: '${index + 1}',
                color: Colors.white,
              );
            }),
          ),
          SizedBox(height: 4),
          // This displays dots for dates with events in the first week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              List<Color> dotColors = [];
              if (index == 0) dotColors = [Colors.red, Colors.purple, Colors.green];
              if (index == 4) dotColors = [Colors.purple, Colors.green, Colors.orange];
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dotColors
                    .map((color) => Container(
                          width: 4,
                          height: 4,
                          margin: EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                        ))
                    .toList(),
              );
            }),
          ),
          _isExpanded ? _buildExpandedCalendar() : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildExpandedCalendar() {
    return Column(
      children: List.generate(5, (weekIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (dayIndex) {
            int day = weekIndex * 7 + dayIndex + 1;
            return Expanded(
              child: Center(
                child: Column(
                  children: [
                    CustomText(
                      text: '$day',
                      color: Colors.white,
                    ),
                    if (_hasEventForDay(day))
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _getDotsForDay(day),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  bool _hasEventForDay(int day) {
    // Determine if the day has events based on your criteria
    return day == 1 || day == 7 || day == 14 || day == 24;
  }

  List<Widget> _getDotsForDay(int day) {
    // Return dots based on the day with events
    List<Color> dotColors = [];
    if (day == 1) dotColors = [Colors.red, Colors.purple, Colors.green];
    if (day == 14) dotColors = [Colors.blue, Colors.orange];
    if (day == 24) dotColors = [Colors.purple, Colors.green, Colors.orange];

    return dotColors
        .map((color) => Container(
              width: 4,
              height: 4,
              margin: EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ))
        .toList();
  }
}
