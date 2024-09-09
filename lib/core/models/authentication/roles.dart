class Role {
  final int id;
  final String role;

  Role({
    required this.id,
    required this.role,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['Id'] ?? 0, // Replace with the correct key from your JSON
      role: json['Name'] ?? '', // Replace with the correct key from your JSON
    );
  }
}
