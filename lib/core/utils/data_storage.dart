import 'dart:convert';
import 'package:badminton/core/models/authentication/login_user_model.dart';
import 'package:badminton/modules/authentication/controllers/raq_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String? _token;

  Future<void> saveToken(String token) async {
    _token = token;
    await _storage.write(key: 'auth_token', value: token);
  }

  String? getTokenSync() {
    return _token;
  }

  Future<void> loadToken() async {
    _token = await _storage.read(key: 'auth_token');
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> save(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  Future<String?> getId() async {
    return await _storage.read(key: 'userId');
  }

//===============Login User=======================//

  Future<LoginUser?> getCurrentLoginUser() async {
    String? userData = await _storage.read(key: 'login_user_data');
    if (userData != null) {
      Map<String, dynamic> userMap = json.decode(userData);
      return LoginUser.fromJson(userMap);
    }
    return null;
  }

  Future<void> storeLoginResponse(LoginResponse loginResponse) async {
    String jsonString = loginResponse.toJsonString();
    await _storage.write(key: 'login_user_data', value: jsonString);
    await _storage.write(key: 'userId', value: loginResponse.user.id.toString());
  }

  Future<LoginResponse?> getLoginResponse() async {
    String? jsonString = await _storage.read(key: 'login_user_data');
    if (jsonString == null) {
      return null;
    }
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return LoginResponse.fromJson(jsonMap);
  }

  // Store Academy model
  Future<void> storeAcademy(Academy academy) async {
    String jsonString = jsonEncode(academy.toJson());
    await _storage.write(key: 'academy', value: jsonString);
  }

  // // Retrieve Academy model
  Future<Academy?> getAcademy() async {
    String? jsonString = await _storage.read(key: 'academy');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Academy.fromJson(jsonMap);
    }
    return null;
  }

  Future<void> clearLoginResponse() async {
    await _storage.delete(key: 'login_user_data');
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'userId');
  }

  void deleteAll() {
    _storage.deleteAll();
  }
}

final dataStorageProvider = Provider<DataStorage>((ref) {
  return DataStorage();
});
