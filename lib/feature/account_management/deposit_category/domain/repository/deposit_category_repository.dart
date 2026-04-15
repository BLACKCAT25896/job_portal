import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class DepositCategoryRepository{
  final ApiClient apiClient;
  DepositCategoryRepository({required this.apiClient});


  Future<Response?> getDepositCategoryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.depositCategory}?page=$page&perPage=1000&search=$search");
  }


  Future<Response?> getDepositCategoryDetails(int id) async {
    return await apiClient.getData("${AppConstants.depositCategory}/$id");
  }
  Future<Response?> createDepositCategory(String name) async {
    return await apiClient.postData(AppConstants.depositCategory, {
      'name': name,
    });
  }

  Future<Response?> updateDepositCategory(String name, int id) async {
    return await apiClient.postData("${AppConstants.depositCategory}/$id",  {
      'name': name,
      '_method': 'PUT'
    },);
  }



  Future<Response?> deleteDepositCategory (int id) async {
    return await apiClient.deleteData("${AppConstants.depositCategory}/$id");
  }
}