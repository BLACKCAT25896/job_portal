import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class ExpanseCategoryRepository{
  final ApiClient apiClient;
  ExpanseCategoryRepository({required this.apiClient});


  Future<Response?> getExpensesCategoryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.expensesCategory}?page=$page&perPage=1000&search=$search");
  }

  Future<Response?> getExpensesCategoryDetails(int id) async {
    return await apiClient.getData("${AppConstants.expensesCategory}/$id");
  }

  Future<Response?> createNewExpensesCategory(String name) async {
    return await apiClient.postData(AppConstants.expensesCategory, {
      'name': name,
    });
  }

  Future<Response?> updateExpensesCategory(String name,  int id) async {
    return await apiClient.postData("${AppConstants.expensesCategory}/$id", {
      'name': name,
      '_method': 'PUT'
    });
  }



  Future<Response?> deleteExpensesCategory (int id) async {
    return await apiClient.deleteData("${AppConstants.expensesCategory}/$id");
  }
}