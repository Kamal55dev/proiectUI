import 'package:badminton/core/endpoints/endpoints.dart';
import 'package:badminton/core/models/authentication/sign_up_model.dart';
import 'package:badminton/core/utils/data_storage.dart';
import 'package:badminton/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider((ref) => DioClient(Dio()));
final authServiceProvider = Provider((ref) => AuthService(ref.read(dioClientProvider), ref.read(dataStorageProvider)));

class AuthService {
  final DioClient _dioClient;
  // ignore: unused_field
  final DataStorage _dataStorage;

  AuthService(this._dioClient, this._dataStorage);

  Future<Response> login(BuildContext context, String email) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.login,
      data: {'email': email},
    );
    return response;
  }

  Future<Response> getRoles() async {
    final response = await _dioClient.dio.get(ApiEndpoints.getRoles);
    return response;
  }

  // Future<Response> logout() async {
  //   final token = await _dataStorage.getToken();
  //   final response = await _dioClient.dio.post(
  //     ApiEndpoints.logout,
  //     options: Options(
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     ),
  //   );
  //   return response;
  // }

  Future<Response> register(SignUpModel model) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.register,
      data: model.toJson(),
    );
    return response;
  }
}
