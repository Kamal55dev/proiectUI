// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // This is a list of state providers that each store a boolean for the circle selection.
// final technicalSkillsProvider = StateProvider<List<bool>>((ref) => List.generate(7, (index) => false));
// final hittingSkillsProvider = StateProvider<List<bool>>((ref) => List.generate(7, (index) => false));


import 'package:flutter_riverpod/flutter_riverpod.dart';

final technicalSkillsProvider = StateProvider<List<bool>>((ref) {
  // Return a list with 8 skills, all set to false initially
  return List.generate(8, (index) => false);
});

final hittingSkillsProvider = StateProvider<List<bool>>((ref) {
  // Return a list with 7 skills, all set to false initially
  return List.generate(7, (index) => false);
});
