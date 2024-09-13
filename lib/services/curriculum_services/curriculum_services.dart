import 'package:badminton/core/endpoints/endpoints.dart';
import 'package:badminton/core/models/authentication/login_user_model.dart';
import 'package:badminton/core/utils/data_storage.dart';
import 'package:badminton/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider((ref) => DioClient(Dio()));
final curriculumServiceProvider =
    Provider((ref) => CurriculumServices(ref.read(dioClientProvider), ref.read(dataStorageProvider)));

class CurriculumServices {
  final DioClient _dioClient;
  final DataStorage _dataStorage;

  CurriculumServices(this._dioClient, this._dataStorage);
  Future<Response> getCurriculumById(int userId) async {
    final DataStorage dataStorage = DataStorage();
    LoginResponse? loginResponse = await dataStorage.getLoginResponse();
    final academyId = loginResponse!.user.academyId.toString();
    final endpoints = ApiEndpoints().getCurriculumById(academyId);
    try {
      // log('Request URL: $endpoints');
      final response = await _dioClient.dio.get(endpoints);
      return response;
    } catch (error) {
      // log("Error in getCurriculumById: $error");
      rethrow;
    }
  }

  Future<Response> getCurriculumShedule(
    int curriculumId,
  ) async {
    final DataStorage dataStorage = DataStorage();
    LoginResponse? loginResponse = await dataStorage.getLoginResponse();
    final acandemyId = loginResponse!.user.academyId.toString();
    final endpoints = ApiEndpoints().getCurriculumShedule(acandemyId, curriculumId);
    try {
      // log('Request URL: $endpoints');
      final response = await _dioClient.dio.get(endpoints);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> getCurriculum(int curriculumId, int sheduleId) async {
    final DataStorage dataStorage = DataStorage();
    LoginResponse? loginResponse = await dataStorage.getLoginResponse();
    final acandemyId = loginResponse!.user.academyId.toString();
    final endpoints = ApiEndpoints().getCurriculum(acandemyId, curriculumId, sheduleId);
    try {
      // log('Request URL*************: $endpoints');
      final response = await _dioClient.dio.get(endpoints);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
