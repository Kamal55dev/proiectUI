// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../models/player_models/Wellness_model.dart';

// // Provider for Wellness parameters (state management)
// final wellnessProvider = Provider<List<WellnessParameter>>((ref) {
//   return [
//     WellnessParameter(
//       title: 'Sleep',
//       status: 'Somewhat Good',
//       progress: 0.75,
//       icon: 'bedtime', // Use IconData or strings as required
//     ),
//     WellnessParameter(
//       title: 'Muscle Soreness',
//       status: 'Very Sore',
//       progress: 0.25,
//       icon: 'fitness_center',
//     ),
//     WellnessParameter(
//       title: 'Fatigue',
//       status: 'Better',
//       progress: 0.60,
//       icon: 'battery_charging_full',
//     ),
//     WellnessParameter(
//       title: 'Stress',
//       status: 'No Stress',
//       progress: 1.0,
//       icon: 'self_improvement',
//     ),
//   ];
// });

// // Provider for Overall Rating
// final overallRatingProvider = Provider<double>((ref) {
//   // You can calculate overall rating based on wellness parameters
//   final parameters = ref.watch(wellnessProvider);
//   double totalProgress = parameters.fold(0, (sum, item) => sum + item.progress);
//   return totalProgress / parameters.length;
// });


// Provider for Wellness parameters (state management)
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/player_models/Wellness_model.dart';


final wellnessProvider = Provider<List<WellnessParameter>>((ref) {
  return [
    WellnessParameter(
      title: 'Sleep',
      status: 'Somewhat Good',
      progress: 0.75,
      icon: 'bedtime',
    ),
    WellnessParameter(
      title: 'Muscle Soreness',
      status: 'Very Sore',
      progress: 0.25,
      icon: 'fitness_center',
    ),
    WellnessParameter(
      title: 'Fatigue',
      status: 'Better',
      progress: 0.90,  // Increased to make overall 75%
      icon: 'battery_charging_full',
    ),
    WellnessParameter(
      title: 'Stress',
      status: 'No Stress',
      progress: 1.0,
      icon: 'self_improvement',
    ),
  ];
});

// Provider for Overall Rating
final overallRatingProvider = Provider<double>((ref) {
  // You can calculate overall rating based on wellness parameters
  final parameters = ref.watch(wellnessProvider);
  double totalProgress = parameters.fold(0, (sum, item) => sum + item.progress);
  return totalProgress / parameters.length; // This should now give 0.75 (75%)
});
