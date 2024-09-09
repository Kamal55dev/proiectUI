import 'dart:io';
import 'package:badminton/core/endpoints/endpoints.dart';
import 'package:badminton/core/models/authentication/login_user_model.dart';
import 'package:badminton/core/utils/data_storage.dart';
import 'package:badminton/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider((ref) => DioClient(Dio()));
final profileServiceProvider =
    Provider((ref) => ProfileServices(ref.read(dioClientProvider), ref.read(dataStorageProvider)));

class ProfileServices {
  final DioClient _dioClient;
  // ignore: unused_field
  final DataStorage _dataStorage;
  ProfileServices(this._dioClient, this._dataStorage);

  Future<String?> uploadImage(File image) async {
    final DataStorage dataStorage = DataStorage();
    LoginResponse? loginResponse = await dataStorage.getLoginResponse();
    final userId = loginResponse!.user.id.toString();
    final endPoint = ApiEndpoints().getProfileImagePath(userId);

    String fileName = image.path.split('/').last;

    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {
      Response response = await _dioClient.dio.post(
        endPoint,
        data: formData,
      );

      if (response.statusCode == 202) {
        // debugPrint('Image uploaded successfully: ${response.data}');
        return response.data['image_url'];
      } else {
        // debugPrint('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      // debugPrint('Error uploading image: $e');
    }
    return null;
  }

  Future<String?> getProfileImage() async {
    final DataStorage dataStorage = DataStorage();
    LoginResponse? loginResponse = await dataStorage.getLoginResponse();
    final userId = loginResponse!.user.id.toString();
    final endPoint = ApiEndpoints().getProfileImagePath(userId);

    return endPoint;
  }
}
