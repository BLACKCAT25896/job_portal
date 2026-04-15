import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/role_and_permission/role/domain/models/role_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class RoleRepository{
  final ApiClient apiClient;
  RoleRepository({required this.apiClient});


  Future<Response?> getRoleList(int page) async {
    return await apiClient.getData("${AppConstants.roles}?page=$page&perPage=10");
  }

  Future<Response?> getPermissionList() async {
    return await apiClient.getData("${AppConstants.permissionList}?page=1&per_page=3000");
  }

  Future<Response?> createNewRole(RoleBody roleBody) async {
    return await apiClient.postData(AppConstants.roles, roleBody.toJson());
  }

  Future<Response?> updateRole(RoleBody roleBody, int id) async {
    return await apiClient.putData("${AppConstants.roles}/$id", roleBody.toJson());
  }



  Future<Response?> deleteRole (int id) async {
    return await apiClient.deleteData("${AppConstants.roles}/$id");
  }
}