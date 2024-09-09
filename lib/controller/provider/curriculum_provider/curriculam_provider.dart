import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/player_models/RAK_curriculum/Curriculam_model.dart';

final curriculumProvider = Provider<List<Subject>>((ref) {
  return [
    Subject(
      date: '24',
      monthYear: 'Sep 2024',
      title: 'Basic Technical Skills',
      name: 'Jaya Prakash',
      status: 'This Month',
      hasDot: true,
    ),
    Subject(
      date: '24',
      monthYear: 'Sep 2024',
      title: 'Basic Technical Skills',
      name: 'Jaya Prakash',
      status: 'This Month',
      hasDot: false,
    ),
    Subject(
      date: '24',
      monthYear: 'Sep 2024',
      title: 'Basic Technical Skills',
      name: 'Jaya Prakash',
      status: 'August 2024',
      hasDot: false,
    ),
  ];
});
