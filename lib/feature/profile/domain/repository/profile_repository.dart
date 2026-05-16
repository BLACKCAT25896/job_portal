import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/authentication/domain/model/create_company_account_body.dart';
import 'package:job/feature/profile/domain/model/status_update_body.dart';
import 'package:job/util/app_constants.dart';

class ProfileRepository{
  final ApiClient apiClient;
  ProfileRepository({required this.apiClient});


  Future<Response?> getProfileInfo() async {
    return await apiClient.getData(AppConstants.profile);
  }

  Future<Response?> getCandidateProfileInfo() async {
    return await apiClient.getData(AppConstants.candidateProfile);
  }

  Future<Response?> getCompanyProfileInfo() async {
    return await apiClient.getData(AppConstants.companyProfile);
  }

  Future<Response?> globalStatusUpdate(StatusUpdateBody body) async {
    return await apiClient.postData(AppConstants.globalStatusUpdate, body.toJson());
  }


  Future<Response?> uploadImage(XFile? file) async {
    return await apiClient.uploadFile(AppConstants.galleries, {},
        MultipartBody('image', file));
  }


  Future<Response?> updateProfile(String name, String email) async {
    return await apiClient.postData(AppConstants.profileUpdate, {
      'name': name,
      'email': email,
    });
  }

  Future<Response?> updateCompanyProfile(CreateCompanyAccountBody body) async {
    return await apiClient.postData(AppConstants.companyProfileUpdate, body.toJson());
  }

  Future<Response?> companyLogoUpdate(XFile? file) async {
    return await apiClient.uploadFile(AppConstants.companyProfileUpdate, {},
        MultipartBody('logo', file));
  }

  Future<Response?> avatarUpdateProfile(XFile? avatar) async {
    return await apiClient.postMultipartData(AppConstants.profileUpdate, {
    }, [], MultipartBody('avatar', avatar), [] );
  }

  Future<Response?> changePassword(String oldPassword, String newPassword) async {
    return await apiClient.postData(AppConstants.changePassword, {
      'current_password': oldPassword,
      'password': newPassword,
      'password_confirmation': newPassword,
    });
  }

}