// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/provider/Wellness_provider.dart';
import '../modules/player_models/Wellness_model.dart';

class WellnessScreen extends ConsumerStatefulWidget {
  const WellnessScreen({super.key});

  @override
  ConsumerState<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends ConsumerState<WellnessScreen> {
  String selectedPeriod = 'today'; // Default selection

  void _selectPeriod(String period) {
    setState(() {
      selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wellnessParameters = ref.watch(wellnessProvider);
    final overallRating = ref.watch(overallRatingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildButton(context, 'Today', 'today'),
                  const SizedBox(width: 8),
                  _buildButton(context, 'This Week', 'this_week'),
                  const SizedBox(width: 8),
                  _buildButton(context, 'This Month', 'this_month'),
                  const SizedBox(width: 8),
                  _buildButton(context, 'Last 90 Days', 'last_90_days'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSelectedPeriodContent(wellnessParameters, selectedPeriod),
            const SizedBox(height: 20),
            _buildOverallRating(overallRating),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, String period) {
    return OutlinedButton(
      onPressed: () {
        _selectPeriod(period);
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: selectedPeriod == period ? Colors.orange : Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSelectedPeriodContent(List<WellnessParameter> parameters, String period) {
    switch (period) {
      case 'today':
        return _buildWellnessParameterCards(parameters);
      case 'this_week':
        return _buildWeeklyView();
      case 'this_month':
        return _buildMonthlyView();
      case 'last_90_days':
        return _build90DaysView();
      default:
        return Container();
    }
  }

  Widget _buildWeeklyView() {
    // Sample data for the week
    final weeklyData = [
      {'day': 'Mon', 'value': 0.65},
      {'day': 'Tue', 'value': 0.85},
      {'day': 'Wed', 'value': 0.15},
      {'day': 'Thu', 'value': 1.00},
      {'day': 'Fri', 'value': 0.50},
      {'day': 'Sat', 'value': 0.70},
      {'day': 'Sun', 'value': 1.00},
    ];

    return _buildTimeBasedView(weeklyData, 'Weekly Average');
  }

  Widget _buildMonthlyView() {
    // Sample data for the month (showing only a week for brevity)
    final monthlyData = [
      {'day': 'Mon', 'value': 0.65},
      {'day': 'Tue', 'value': 0.85},
      {'day': 'Wed', 'value': 0.15},
      {'day': 'Thu', 'value': 1.00},
      {'day': 'Fri', 'value': 0.50},
      {'day': 'Sat', 'value': 0.70},
      {'day': 'Sun', 'value': 1.00},
    ];

    return _buildTimeBasedView(monthlyData, 'Monthly Average');
  }

  Widget _build90DaysView() {
    // Sample data for 90 days (showing only a week for brevity)
    final ninetyDaysData = [
      {'day': 'Week 1', 'value': 0.75},
      {'day': 'Week 2', 'value': 0.80},
      {'day': 'Week 3', 'value': 0.60},
      {'day': 'Week 4', 'value': 0.90},
    ];

    return _buildTimeBasedView(ninetyDaysData, '90 Days Average');
  }

  Widget _buildTimeBasedView(List<Map<String, dynamic>> data, String averageButtonText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Wellness Parameters',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLabelCard('Sleep'),
          const VerticalDivider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
          _buildLabelCard('Soreness'),
          const VerticalDivider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
          _buildLabelCard('Fatigue'),
          const VerticalDivider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
          _buildLabelCard('Stress'),
        ],
      ),
      const SizedBox(height: 16),
      ...data.map((day) => _buildDayProgressBar(day['day'] as String, day['value'] as double)),
      const SizedBox(height: 20),
      Center(
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.orange),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            averageButtonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

Widget _buildLabelCard(String label) {
  return Expanded(
    child: Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      ),
    ),
  );
}


  Widget _buildDayProgressBar(String day, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text(day, style: const TextStyle(color: Colors.white70))),
          const SizedBox(width: 8),
          Text('${(value * 100).toInt()}%', style: const TextStyle(color: Colors.white70)),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.grey.shade800,
                valueColor: AlwaysStoppedAnimation<Color>(_getColorForValue(value)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForValue(double value) {
    if (value < 0.3) return Colors.red;
    if (value < 0.7) return Colors.orange;
    return Colors.green;
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
            backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
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
                  const SizedBox(width: 130),
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

  Widget _buildWellnessParameterCards(List<WellnessParameter> parameters) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWellnessCard(parameters[0], "Sleep", "Somewhat Good"),
            _buildWellnessCard(parameters[1], "Muscle Soreness", "Very Sore"),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWellnessCard(parameters[2], "Fatigue", "Better"),
            _buildWellnessCard(parameters[3], "Stress", "No Stress"),
          ],
        ),
      ],
    );
  }

  Widget _buildWellnessCard(WellnessParameter parameter, String title, String description) {
    IconData iconData = _getIconFromString(parameter.icon);
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(iconData, size: 30),
                  const SizedBox(width: 8),
                  Text(title),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: 150,
                  height: 10,
                  child: LinearProgressIndicator(
                    value: parameter.progress,
                    backgroundColor: Colors.grey.shade700,
                    color: parameter.progress > 0.5 ? Colors.green : Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'bedtime':
        return Icons.bedtime;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'battery_charging_full':
        return Icons.battery_charging_full;
      case 'self_improvement':
        return Icons.self_improvement;
      default:
        return Icons.help;
    }
  }

  Widget _buildOverallRating(double rating) {
    return SizedBox(
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.orange),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Overall Rating', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              Text(
                '${(rating * 100).toInt()}%',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: 145,
                  height: 10,
                  child: LinearProgressIndicator(
                    value: rating,
                    backgroundColor: Colors.grey.shade700,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../controller/provider/Wellness_provider.dart';
// import '../modules/player_models/Wellness_model.dart';

// class WellnessScreen extends ConsumerStatefulWidget {
//   const WellnessScreen({super.key});

//   @override
//   ConsumerState<WellnessScreen> createState() => _WellnessScreenState();
// }

// class _WellnessScreenState extends ConsumerState<WellnessScreen> {
//   String selectedPeriod = 'today'; // Default selection

//   void _selectPeriod(String period) {
//     setState(() {
//       selectedPeriod = period;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final wellnessParameters = ref.watch(wellnessProvider);
//     final overallRating = ref.watch(overallRatingProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wellness'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileCard(),
//             const SizedBox(height: 20),
//             Card(
//               color: Colors.grey[850],
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           _buildButton(context, 'Today', 'today'),
//                           const SizedBox(width: 8),
//                           _buildButton(context, 'This Week', 'this_week'),
//                           const SizedBox(width: 8),
//                           _buildButton(context, 'This Month', 'this_month'),
//                           const SizedBox(width: 8),
//                           _buildButton(context, 'Last 90 Days', 'last_90_days'),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     _buildSelectedPeriodContent(wellnessParameters, selectedPeriod),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildOverallRating(overallRating),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton(BuildContext context, String text, String period) {
//     return OutlinedButton(
//       onPressed: () {
//         _selectPeriod(period);
//       },
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(color: selectedPeriod == period ? Colors.orange : Colors.grey),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildSelectedPeriodContent(List<WellnessParameter> parameters, String period) {
//     switch (period) {
//       case 'today':
//         return _buildWellnessParameterCards(parameters);
//       case 'this_week':
//       case 'this_month':
//       case 'last_90_days':
//         return _buildTimeBasedView(period);
//       default:
//         return Container();
//     }
//   }

//   Widget _buildWellnessParameterCards(List<WellnessParameter> parameters) {
//     if (parameters.isEmpty) return Container(); // Ensure we have parameters

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildWellnessCard(parameters[0], "Sleep"),
//             _buildWellnessCard(parameters[1], "Muscle Soreness"),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildWellnessCard(parameters[2], "Fatigue"),
//             _buildWellnessCard(parameters[3], "Stress"),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildWellnessCard(WellnessParameter parameter, String title) {
//     IconData iconData = _getIconFromString(parameter.icon);

//     return Expanded(
//       child: Card(
//         color: Colors.grey[850],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(iconData, size: 30),
//                   const SizedBox(width: 8),
//                   Text(title),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(5),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 10,
//                   child: LinearProgressIndicator(
//                     value: parameter.progress, // Use 'progress' instead of 'value'
//                     backgroundColor: Colors.grey.shade700,
//                     color: _getColorForValue(parameter.progress),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 '${(parameter.progress * 100).toInt()}%', // Display percentage
//                 style: const TextStyle(color: Colors.white70),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Color _getColorForValue(double value) {
//     if (value < 0.3) return Colors.red;
//     if (value < 0.7) return Colors.orange;
//     return Colors.green;
//   }

//   IconData _getIconFromString(String iconName) {
//     switch (iconName) {
//       case 'bedtime':
//         return Icons.bedtime;
//       case 'fitness_center':
//         return Icons.fitness_center;
//       case 'battery_charging_full':
//         return Icons.battery_charging_full;
//       case 'self_improvement':
//         return Icons.self_improvement;
//       default:
//         return Icons.help;
//     }
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
//             backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
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
//                   const SizedBox(width: 130),
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

//   Widget _buildTimeBasedView(String period) {
//     List<Map<String, dynamic>> data;

//     switch (period) {
//       case 'this_week':
//         data = [
//           {'day': 'Mon', 'value': 0.65},
//           {'day': 'Tue', 'value': 0.85},
//           {'day': 'Wed', 'value': 0.15},
//           {'day': 'Thu', 'value': 1.00},
//           {'day': 'Fri', 'value': 0.50},
//           {'day': 'Sat', 'value': 0.70},
//           {'day': 'Sun', 'value': 1.00},
//         ];
//         break;
//       case 'this_month':
//         data = [
//           {'day': 'Mon', 'value': 0.65},
//           {'day': 'Tue', 'value': 0.85},
//           {'day': 'Wed', 'value': 0.15},
//           {'day': 'Thu', 'value': 1.00},
//           {'day': 'Fri', 'value': 0.50},
//           {'day': 'Sat', 'value': 0.70},
//           {'day': 'Sun', 'value': 1.00},
//         ];
//         break;
//       case 'last_90_days':
//         data = [
//           {'day': 'Week 1', 'value': 0.75},
//           {'day': 'Week 2', 'value': 0.80},
//           {'day': 'Week 3', 'value': 0.60},
//           {'day': 'Week 4', 'value': 0.90},
//         ];
//         break;
//       default:
//         data = [];
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Wellness Parameters',
//           style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildLabelCard('Sleep'),
//             const VerticalDivider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
//             _buildLabelCard('Soreness'),
//             const VerticalDivider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
//             _buildLabelCard('Fatigue'),
//             const VerticalDivider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
//             _buildLabelCard('Stress'),
//           ],
//         ),
//         const SizedBox(height: 16),
//         ...data.map((day) => _buildDayProgressBar(day['day'] as String, day['value'] as double)),
//         const SizedBox(height: 20),
//         Center(
//           child: OutlinedButton(
//             onPressed: () {},
//             style: OutlinedButton.styleFrom(
//               side: const BorderSide(color: Colors.orange),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             child: const Text(
//               'Weekly Average', // Changed text here
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDayProgressBar(String day, double value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           SizedBox(width: 40, child: Text(day, style: TextStyle(color: Colors.white70))),
//           const SizedBox(width: 8),
//           Text('${(value * 100).toInt()}%', style: TextStyle(color: Colors.white70)),
//           const SizedBox(width: 8),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: LinearProgressIndicator(
//                 value: value,
//                 backgroundColor: Colors.grey.shade800,
//                 valueColor: AlwaysStoppedAnimation<Color>(_getColorForValue(value)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLabelCard(String label) {
//     return Expanded(
//       child: Card(
//         color: Colors.grey[850],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           child: Center(
//             child: Text(
//               label,
//               style: const TextStyle(color: Colors.white70, fontSize: 14),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOverallRating(double rating) {
//     return SizedBox(
//       width: 400,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               OutlinedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.orange),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 ),
//                 child: const Text('Weekly Average', style: TextStyle(color: Colors.white)), // Changed text here
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 '${(rating * 100).toInt()}%',
//                 style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(5),
//                 child: SizedBox(
//                   width: 145,
//                   height: 10,
//                   child: LinearProgressIndicator(
//                     value: rating,
//                     backgroundColor: Colors.grey.shade700,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




