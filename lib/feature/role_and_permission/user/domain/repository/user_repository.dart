import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class UserRepository{
  final ApiClient apiClient;
  UserRepository({required this.apiClient});


  Future<Response?> getUserList(int page, {String search = "", String userType = ""}) async {
    return await apiClient.getData("${AppConstants.user}?perPage=10&user_type=$userType&search=$search&page=$page");
  }

  Future<Response?> createNewUser(UserBody body, XFile? image) async {
    return await apiClient.postMultipartData(AppConstants.user, body.toJson(), [],
    MultipartBody("avatar", image), []);
  }

  Future<Response?> updateUser(UserBody body, XFile? image, int id) async {
    return await apiClient.postMultipartData("${AppConstants.user}/$id",body.toJson(), [],
        MultipartBody("avatar", image), []);
  }
  

  Future<Response?> deleteUser (int id) async {
    return await apiClient.deleteData("${AppConstants.user}/$id");
  }
}