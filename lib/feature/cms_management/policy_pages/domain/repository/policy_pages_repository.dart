import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class PagesRepository {
  final ApiClient apiClient;

  PagesRepository({required this.apiClient});
  
  Future<Response?> getPage(int page) async {
    return await apiClient.getData("${AppConstants.policies}?page=$page&perPage=10");
  }

  Future<Response?> editPage(int id, String type, String description) async {
    return await apiClient.postData("${AppConstants.policies}/$id", {
      "_method": "put",
      "type": type.toString(),
      "description": description.toString()
    });
  }

  Future<Response?> addNewPage( String type, String description) async {
    return await apiClient.postData(AppConstants.policies, {
      "type": type.toString(),
      "description": description.toString()
    });
  }

  Future<Response?> deletePages(int id) async {
    return await apiClient.deleteData("${AppConstants.policies}/$id");
  }

}
  