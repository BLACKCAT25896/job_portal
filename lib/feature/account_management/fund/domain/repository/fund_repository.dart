import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/account_management/fund/domain/model/fund_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class FundRepository {
  final ApiClient apiClient;

  FundRepository({required this.apiClient});
  
  Future<Response?> getFund(int page) async {
    return await apiClient.getData("${AppConstants.fund}?page=$page");
  }

  Future<Response?> createFund(FundBody body) async {
    return await apiClient.postData(AppConstants.fund,body.toJson());
  }

  Future<Response?> editFund(FundBody body, int id) async {
    return await apiClient.postData("${AppConstants.fund}/$id",body.toJson());
  }

  Future<Response?> deleteFund(int id) async {
    return await apiClient.deleteData("${AppConstants.fund}/$id");
  }

}
  