// lib/models/curriculum_item.dart

class CurriculumItem {
  final String title;
  final String description;
  final String imageUrl;
  final List<Exercise> exercises;

  CurriculumItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.exercises,
  });
}

class Exercise {
  final String name;
  final String description;
  final String imageUrl;

  Exercise({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class CurriculumData {
  final String date;
  final String month;
  final String year;
  final String level;
  final String programName;
  final String intensity;
  final List<CurriculumItem> sections;

  CurriculumData({
    required this.date,
    required this.month,
    required this.year,
    required this.level,
    required this.programName,
    required this.intensity,
    required this.sections,
  });
}