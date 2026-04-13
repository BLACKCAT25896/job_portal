import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class DesignationRepository{
  final ApiClient apiClient;
  DesignationRepository({required this.apiClient});


  Future<Response?> getDesignationList(int page) async {
    return await apiClient.getData("${AppConstants.designations}?page=$page&perPage=10");
  }

  Future<Response?> createNewDesignation( String name,) async {
    Map<String, String> fields = <String, String> {
      'title': name,
      'status': "1",
    };

    return await apiClient.postData(AppConstants.designations, fields);
  }

  Future<Response?> updateDesignation( String name, int id) async {
    Map<String, String> fields = <String, String> {
      'title': name,
      'status': "1",
    };
    return await apiClient.putData("${AppConstants.designations}/$id", fields);
  }
  

  Future<Response?> deleteDesignation (int id) async {
    return await apiClient.deleteData("${AppConstants.designations}/$id");
  }
}