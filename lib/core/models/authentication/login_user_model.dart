import 'dart:convert';

class LoginUser {
  int? id;
  String? name;
  String? nickName;
  String email;
  String? phone;
  String? dateOfBirth;
  String? gender;
  String? image;
  String? authType;
  String notification;
  String? displayImage;
  String language;
  int? isActive;
  String? roleName;
  int? academyId;
  int? category;
  int? role;
  int? isOrientationTeam;
  String? address;

  LoginUser(
      {this.id,
      this.name,
      this.nickName,
      required this.email,
      this.phone,
      this.dateOfBirth,
      this.gender,
      this.image,
      this.authType,
      required this.notification,
      this.displayImage,
      required this.language,
      this.isActive,
      this.role,
      this.roleName,
      this.academyId,
      this.category,
      this.isOrientationTeam,
      this.address});

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['userId'],
      name: json['name'],
      nickName: json['nickName'],
      email: json['email'],
      phone: json['mobileNumber'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      image: json['displayImage'],
      authType: json['auth_type'],
      notification: json['notification'],
      displayImage: json['displayImage'],
      language: json['language'],
      isActive: json['isActive'],
      role: json['role'],
      roleName: json['roleName'],
      academyId: json['academyId'],
      category: json['category'],
      isOrientationTeam: json['isOrientationTeam'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['userId'] = id;
    if (name != null) data['name'] = name;
    if (nickName != null) data['nickName'] = nickName;
    data['email'] = email;
    if (phone != null) data['mobileNumber'] = phone;
    if (dateOfBirth != null) data['dateOfBirth'] = dateOfBirth;
    if (gender != null) data['gender'] = gender;
    if (image != null) data['displayImage'] = image;
    if (authType != null) data['auth_type'] = authType;
    data['notification'] = notification;
    data['displayImage'] = displayImage;
    data['language'] = language;
    if (isActive != null) data['isActive'] = isActive;
    if (role != null) data['role'] = role;
    if (roleName != null) data['roleName'] = roleName;
    if (academyId != null) data['academyId'] = academyId;
    if (isOrientationTeam != null) {
      data['isOrientationTeam'] = isOrientationTeam;
    }
    if (category != null) {
      data['category'] = category;
    }
    return data;
  }
}

class AccessToken {
  String token;
  DateTime expires;

  AccessToken({
    required this.token,
    required this.expires,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      token: json['token'],
      expires: DateTime.parse(json['expires']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expires': expires.toIso8601String(),
    };
  }
}

class LoginResponse {
  LoginUser user;
  AccessToken tokenObj;

  LoginResponse({
    required this.user,
    required this.tokenObj,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: LoginUser.fromJson(json['user']),
      tokenObj: AccessToken.fromJson(json['tokenObj']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'tokenObj': tokenObj.toJson(),
    };
  }

  String toJsonString() {
    final jsonMap = toJson();
    return jsonEncode(jsonMap);
  }
}
