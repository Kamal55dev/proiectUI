class SignUpModel {
  String name;
  String email;
  String mobileNumber;
  String authType;
  String dateOfBirth;
  String address;

  SignUpModel({
    required this.name,
    required this.email,
    required this.mobileNumber,
    this.authType = 'email',
    required this.dateOfBirth,
    required this.address,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      authType: json['authType'] ?? 'email',
      dateOfBirth: json['dateOfBirth'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'authType': authType,
      'dateOfBirth': dateOfBirth,
      'address': address,
    };
  }
}
