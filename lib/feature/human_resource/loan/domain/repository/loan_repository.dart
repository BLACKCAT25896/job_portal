import 'package:mighty_job/feature/human_resource/loan/domain/models/loan_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class LoanRepository{
  final ApiClient apiClient;
  LoanRepository({required this.apiClient});


  Future<Response?> getLoanList(int page) async {
    return await apiClient.getData("${AppConstants.loans}?page=$page&perPage=10");
  }

  Future<Response?> createNewLoan( LoanBody body,) async {
    return await apiClient.postData(AppConstants.loans, body.toJson());
  }

  Future<Response?> updateLoan( LoanBody body, int id) async {
    return await apiClient.putData("${AppConstants.loans}/$id", body.toJson());
  }

  Future<Response?> deleteLoan (int id) async {
    return await apiClient.deleteData("${AppConstants.loans}/$id");
  }
}