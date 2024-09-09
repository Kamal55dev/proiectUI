String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'The email address entered is invalid';
  }

  // Additional validation logic for email format can be added here
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Incorrect Password';
  }
  /*if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }*/
  // Additional validation logic for password format can be added here
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your fullname';
  }
  /*if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }*/
  // Additional validation logic for password format can be added here
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }
  if (value.length < 10) {
    return 'Password must be at least 10 characters long';
  }
  // Additional validation logic for password format can be added here
  return null;
}

String? validateFullname(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your fullname';
  }
  return null;
}

String? validateNickname(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your nickname';
  }
  return null;
}

String? validatePhonenumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phonenumber';
  }
  if (value.length != 10) {
    return 'Phone number must be exactly 10 digits';
  }
  return null;
}

String? validateGender(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your gender';
  }
  return null;
}

String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your address';
  }
  return null;
}

String? validateRaqCode(String value) {
  if (value.isEmpty) {
    return 'Please enter your RAQ Link Code';
  }
  // if (value.length < 10) {
  //   return 'RAQ Link Code must be at least 5 letters';
  // }
  return null;
}

String? validatelicenseNum(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your license number';
  }
  return null;
}

String? validateyearsofExperience(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Experience';
  }
  return null;
}

String? validatecoachingCertificate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Certificates';
  }
  return null;
}

String? validateSpecialist(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Specialist';
  }
  return null;
}

String? validateteamName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your team name';
  }
  return null;
}