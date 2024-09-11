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
    required this.authType,
    required this.dateOfBirth,
    required this.address,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String,
      authType: json['authType'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      address: json['address'] as String,
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
