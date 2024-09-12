class CurriculumbyIdModel {
  final int id;
  final String name;
  final String validTill;
  final String status;
  final int completedProgram;
  final int totalPrograms;

  CurriculumbyIdModel({
    required this.id,
    required this.name,
    required this.validTill,
    required this.status,
    required this.completedProgram,
    required this.totalPrograms,
  });

  factory CurriculumbyIdModel.fromJson(Map<String, dynamic> json) {
    return CurriculumbyIdModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      validTill: json['validTill'] ?? 'Not Available',
      status: json['status'] ?? 'Unknown',
      completedProgram: json['completedProgram'] ?? 0,
      totalPrograms: json['totalPrograms'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'validTill': validTill,
      'status': status,
      'completedProgram': completedProgram,
      'totalPrograms': totalPrograms,
    };
  }
}
