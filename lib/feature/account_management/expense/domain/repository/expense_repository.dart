import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/account_management/expense/domain/model/expense_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class ExpenseRepository{
  final ApiClient apiClient;
  ExpenseRepository({required this.apiClient});


  Future<Response?> getExpenseList(int page, String search) async {
    return await apiClient.getData("${AppConstants.expenses}?page=$page&per_page=10&search=$search");
  }

  Future<Response?> createNewExpense(ExpenseBody expenseBody, XFile? file) async {
    return await apiClient.postMultipartData(AppConstants.expenses, expenseBody.toJson(), [], MultipartBody("image", file), []);
  }

  Future<Response?> updateExpense(ExpenseBody expenseBody, XFile? file, int id) async {
    return await apiClient.postMultipartData("${AppConstants.expenses}/$id", expenseBody.toJson(), [], MultipartBody("image", file), []);
  }



  Future<Response?> deleteExpense (int id) async {
    return await apiClient.deleteData("${AppConstants.expenses}/$id");
  }
}