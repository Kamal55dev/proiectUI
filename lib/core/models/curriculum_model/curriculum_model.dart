class CurriculumModel {
  final String name;
  final List<SectionModel> sections;
  final String validTill;

  CurriculumModel({
    required this.name,
    required this.sections,
    required this.validTill,
  });

  factory CurriculumModel.fromJson(Map<String, dynamic> json) {
    return CurriculumModel(
      name: json['name'] ?? '',
      sections:
          (json['sections'] as List<dynamic>?)?.map((sectionJson) => SectionModel.fromJson(sectionJson)).toList() ?? [],
      validTill: json['validTill'] ?? '',
    );
  }
}

class SectionModel {
  final String sectionName;
  final List<TypeModel> types;

  SectionModel({
    required this.sectionName,
    required this.types,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      sectionName: json['sectionName'] ?? '',
      types: (json['types'] as List<dynamic>?)?.map((typeJson) => TypeModel.fromJson(typeJson)).toList() ?? [],
    );
  }
}

class TypeModel {
  final int id;
  final String name;
  final String status;

  TypeModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? 'Not Started',
    );
  }
}
