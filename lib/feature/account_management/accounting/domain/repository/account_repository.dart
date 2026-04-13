import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_body_model.dart';
import 'package:ecommerce/util/app_constants.dart';

class AccountRepository{
  final ApiClient apiClient;
  AccountRepository({required this.apiClient});


  Future<Response?> getAccountList(int page, {required String search}) async {
    return await apiClient.getData("${AppConstants.accounts}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewAccount(AccountBodyModel accountBody) async {
    return await apiClient.postData(AppConstants.accounts, accountBody.toJson());
  }

  Future<Response?> updateAccount(AccountBodyModel accountBody, int id) async {
    return await apiClient.putData("${AppConstants.accounts}/$id", accountBody.toJson());
  }



  Future<Response?> deleteAccount (int id) async {
    return await apiClient.deleteData("${AppConstants.accounts}/$id");
  }
}