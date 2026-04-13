import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class DepartmentRepository{
  final ApiClient apiClient;
  DepartmentRepository({required this.apiClient});


  Future<Response?> getDepartmentList(int page) async {
    return await apiClient.getData("${AppConstants.department}?page=$page&perPage=10");
  }

  Future<Response?> createNewDepartment( String name,) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      'status': "1",
    };

    return await apiClient.postData(AppConstants.department, fields);
  }

  Future<Response?> updateDepartment( String name, int id) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      'status': "1",
    };
    return await apiClient.putData("${AppConstants.department}/$id", fields);
  }
  

  Future<Response?> deleteDepartment (int id) async {
    return await apiClient.deleteData("${AppConstants.department}/$id");
  }
}