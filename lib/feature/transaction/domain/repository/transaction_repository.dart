import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class TransactionRepository{
  final ApiClient apiClient;
  TransactionRepository({required this.apiClient});


  Future<Response?> getTransactionList(int page, String search) async {
    return await apiClient.getData("${AppConstants.transactions}?page=$page&perPage=10&search=$search");
  }



  Future<Response?> deleteTransaction (int id) async {
    return await apiClient.deleteData("${AppConstants.transactions}/$id");
  }
}