class CurriculumSheduleModel {
  final int id;
  final String name;
  final String status;

  CurriculumSheduleModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory CurriculumSheduleModel.fromJson(Map<String, dynamic> json) {
    return CurriculumSheduleModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }
}

class TrainingProgramList {
  final List<CurriculumSheduleModel> programs;

  TrainingProgramList({
    required this.programs,
  });

  factory TrainingProgramList.fromJson(List<dynamic> json) {
    return TrainingProgramList(
      programs: json.map((item) => CurriculumSheduleModel.fromJson(item)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return programs.map((program) => program.toJson()).toList();
  }
}
