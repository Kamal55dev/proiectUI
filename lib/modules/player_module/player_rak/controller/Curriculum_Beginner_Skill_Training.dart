import 'package:flutter_riverpod/flutter_riverpod.dart';

class Subject {
  final String title;
  final List<Exercise> exercises;

  Subject({required this.title, required this.exercises});
}

class Exercise {
  final String name;
  final String description;
  final String imageUrl;

  Exercise({required this.name, required this.description, required this.imageUrl});
}

class CurriculumNotifier extends StateNotifier<List<Subject>> {
  CurriculumNotifier() : super([
    Subject(
      title: 'Section 1: Technical Skills',
      exercises: [
        Exercise(
          name: 'Running Steps',
          description: 'Short description about the exercise to come here',
          imageUrl: 'assets/images/player_images/backhand_serve_image.png',
        ),
        Exercise(
          name: 'Running Steps',
          description: 'Short description about the exercise to come here',
          imageUrl: 'assets/images/player_images/backhand_serve_image.png',
        ),
      ],
    ),
    Subject(
      title: 'Section 2: Hitting Skills',
      exercises: [
        Exercise(
          name: 'Backhand Serve',
          description: 'Short description about the exercise to come here',
          imageUrl: 'assets/images/player_images/backhand_serve_image.png',
        ),
      ],
    ),
  ]);

  void addSubject(Subject subject) {
    state = [...state, subject];
  }

  void removeSubject(int index) {
    state = [...state]..removeAt(index);
  }

  void updateSubject(int index, Subject updatedSubject) {
    state = [
      ...state.sublist(0, index),
      updatedSubject,
      ...state.sublist(index + 1),
    ];
  }
}

final curriculumProvider = StateNotifierProvider<CurriculumNotifier, List<Subject>>((ref) {
  return CurriculumNotifier();
});
