// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:badminton/core/endpoints/endpoints.dart';
import 'package:badminton/core/models/authentication/login_user_model.dart';
import 'package:badminton/core/models/curriculum_model/curriculum_by_id_model.dart';
import 'package:badminton/core/models/curriculum_model/curriculum_model.dart';
import 'package:badminton/core/models/curriculum_model/curriculum_schedule_model.dart';
import 'package:badminton/core/utils/data_storage.dart';
import 'package:badminton/services/curriculum_services/curriculum_services.dart';
import 'package:badminton/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final curriculamScreenControllerovider = ChangeNotifierProvider((ref) => CurriculamScreenController(ref));

class CurriculamScreenController extends ChangeNotifier {
  int _selectedIndex = -1;
  final DataStorage _dataStorage;
  final CurriculumServices curriculumServices;
  List<CurriculumbyIdModel> _curriculums = [];
  CurriculumModel? _curriculum;
  bool _isCurriculumAssigned = false;

  CurriculamScreenController(Ref ref)
      : curriculumServices = ref.read(curriculumServiceProvider),
        _dataStorage = ref.read(dataStorageProvider);

  int get selectedIndex => _selectedIndex;
  List<CurriculumbyIdModel> get curriculums => _curriculums;
  CurriculumModel? get curriculum => _curriculum;
  bool get isCurriculumAssigned => _isCurriculumAssigned; // Add this getter

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  bool loading = false;
  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  List<CurriculumSheduleModel> curriculamshedule = [];

  Future<void> getCurriculumById(BuildContext context) async {
    try {
      final loginResponse = await _dataStorage.getLoginResponse();
      int academyId;
      if (loginResponse != null && loginResponse.user.id != null) {
        academyId = loginResponse.user.academyId!;
        log('userId ID: $academyId');
      } else {
        log('userId ID not found in storage');
        throw Exception('userId ID not found in storage');
      }

      final response = await curriculumServices.getCurriculumById(academyId);
      if (response.statusCode == 200) {
        log('Success curriculum: ${response.data}');
        _curriculums = (response.data as List).map((json) => CurriculumbyIdModel.fromJson(json)).toList();
        _isCurriculumAssigned = true;
        notifyListeners();
      } else if (response.statusCode == 404) {
        _isCurriculumAssigned = false;
        log("curriculum not found: ${response.statusCode}");
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please contact administrators'),
          ),
        );
      } else {
        _isCurriculumAssigned = false;
        log("Failed to get curriculum: ${response.statusCode}");
      }
    } catch (e) {
      _isCurriculumAssigned = false;
      log("Error getting curriculum: $e");
    }
  }

  Future<void> getCurriculumShedule(int curriculumId, BuildContext context) async {
    try {
      setLoading(true);
      final response = await curriculumServices.getCurriculumShedule(curriculumId);

      if (response.statusCode == 200) {
        log('Success curriculum list: $response');
        final List<dynamic> data = response.data;
        curriculamshedule = data.map((e) => CurriculumSheduleModel.fromJson(e)).toList();
        notifyListeners();
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please contact administrators'),
          ),
        );
      } else {
        log("Failed to curriculum list: ${response.statusCode}");
      }
    } catch (e) {
      log("Error curriculum list: $e");
    } finally {
      setLoading(false);
    }
  }

  Future<void> getCurriculum(int curriculumId, int scheduleId, BuildContext context) async {
    try {
      setLoading(true);
      final response = await curriculumServices.getCurriculum(curriculumId, scheduleId);

      if (response.statusCode == 200) {
        log('Success curriculum************* ${response.data}');

        final data = response.data as List<dynamic>;

        if (data.isNotEmpty) {
          final curriculum = data[0] as Map<String, dynamic>;

          _curriculum = CurriculumModel.fromJson(curriculum);
          notifyListeners();
        } else {
          log("Response data is empty");
        }
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please contact administrators'),
          ),
        );
      } else {
        log("Failed to get curriculum ************* ${response.statusCode}");
      }
    } catch (e) {
      log("Error getting curriculum ************* $e");
    } finally {
      setLoading(false);
    }
  }

  Future<bool> updateCurriculum(int curriculumId, int scheduleId, BuildContext context,
      {required String status, required List<int> drillIds}) async {
    try {
      final DataStorage dataStorage = DataStorage();
      LoginResponse? loginResponse = await dataStorage.getLoginResponse();
      if (loginResponse == null) {
        throw Exception('Login response is null');
      }
      final academyId = loginResponse.user.academyId.toString();
      final endPoints = ApiEndpoints().getCurriculum(academyId, curriculumId, scheduleId);

      final Map<String, dynamic> requestData = {
        'drill': drillIds.map((id) => {'drillId': id, 'status': status}).toList(),
      };

      final response = await dioClient.dio.put(
        endPoints,
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        return true;
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please contact administrators'),
          ),
        );
      } else {
        throw Exception('Failed to update curriculum: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
    return false;
  }
}
