import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/account_management/deposit/domain/model/deposit_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class DepositRepository{
  final ApiClient apiClient;
  DepositRepository({required this.apiClient});


  Future<Response?> getDepositList(int page, String search) async {
    return await apiClient.getData("${AppConstants.deposit}?page=$page&per_page=10&search=$search");
  }

  Future<Response?> createDeposit(DepositBody depositBody, XFile? file) async {
    return await apiClient.postMultipartData(AppConstants.deposit, depositBody.toJson(), [], MultipartBody("evidence", file), []);
  }

  Future<Response?> updateDeposit(DepositBody depositBody, XFile? file, int id) async {
    return await apiClient.postMultipartData("${AppConstants.deposit}/$id", depositBody.toJson(), [], MultipartBody("evidence", file), []);
  }



  Future<Response?> deleteDeposit (int id) async {
    return await apiClient.deleteData("${AppConstants.deposit}/$id");
  }
}