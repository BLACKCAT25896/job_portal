import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/profile/domain/model/status_update_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class ProfileRepository{
  final ApiClient apiClient;
  ProfileRepository({required this.apiClient});


  Future<Response?> getProfileInfo() async {
    return await apiClient.getData(AppConstants.profile);
  }

  Future<Response?> globalStatusUpdate(StatusUpdateBody body) async {
    return await apiClient.postData(AppConstants.globalStatusUpdate, body.toJson());
  }


  Future<Response?> uploadImage(XFile? file) async {
    return await apiClient.uploadFile(AppConstants.galleries, {},
        MultipartBody('image', file));
  }


  Future<Response?> updateProfile(String name, String email) async {
    return await apiClient.postData("", {
      'name': name,
      'email': email,
    });
  }

  Future<Response?> changePassword(String oldPassword, String newPassword) async {
    return await apiClient.postData("", {
      'current_password': oldPassword,
      'password': newPassword,
      'password_confirmation': newPassword,
    });
  }

}