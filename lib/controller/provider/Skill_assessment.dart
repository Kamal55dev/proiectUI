// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/player_models/skill_assessment_models.dart';

// ignore: non_constant_identifier_names
final SkillAssessmentProvider = Provider<List<Subjects>>((ref) {
  return [
    Subjects(
      date: '24',
      monthYear: 'Sep 2024',
      title: 'Rating',
      name: 'Jaya Prakash',
      status: 'This Month',
      hasDot: true,
      rating: 3.8, // Set the rating for the first card
      isRated: true, // Mark this card as rated
    ),
    Subjects(
      date: '15',
      monthYear: 'Sep 2024',
      title: 'Rating',
      name: 'Jaya Prakash',
      status: 'This Month',
      hasDot: false,
      rating: 4.2,
      isRated: true,
    ),
    Subjects(
      date: '02',
      monthYear: 'Sep 2024',
      title: 'Rating',
      name: 'Jaya Prakash',
      status: 'This Month',
      hasDot: false,
      rating: 4.0,
      isRated: true,
    ),
    Subjects(
      date: '24',
      monthYear: 'Aug 2024',
      title: 'Rating',
      name: 'Jaya Prakash',
      status: 'August 2024',
      hasDot: false,
      rating: 3.9,
      isRated: true,
    ),
    Subjects(
      date: '12',
      monthYear: 'Aug 2024',
      title: 'Rating',
      name: 'Jaya Prakash',
      status: 'August 2024',
      hasDot: false,
      rating: 4.1,
      isRated: true,
    ),
  ];
});
