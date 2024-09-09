class SignUpModel {
  final String name;
  final String email;
  final String mobileNumber;
  final int? role;
  final String authType;
  final int academyId;
  final int isOrientationTeam;
  SignUpModel({
    required this.name,
    required this.email,
    required this.mobileNumber,
    this.role,
    this.authType = "email",
    this.academyId = 0,
    this.isOrientationTeam = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'role': role,
      'authType': authType,
      'academyId': academyId,
      'isOrientationTeam': isOrientationTeam
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      role: json['role'] ?? '',
      authType: json['authType'] ?? "email",
      academyId: json['academyId'] ?? 0,
      isOrientationTeam: json['isOrientationTeam'] ?? 1,
    );
  }
}

class UserResponse {
  final int userId;
  final String emailId;
  final String roleName;

  UserResponse({
    required this.userId,
    required this.emailId,
    required this.roleName,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      userId: json['userId'],
      emailId: json['emailId'],
      roleName: json['roleName'],
    );
  }
}
