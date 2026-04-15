import 'package:mighty_job/feature/human_resource/loan_installment/domain/models/loan_installment_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class LoanInstallmentRepository{
  final ApiClient apiClient;
  LoanInstallmentRepository({required this.apiClient});


  Future<Response?> getLoanInstallmentList(int page) async {
    return await apiClient.getData("${AppConstants.loanInstallments}?page=$page&perPage=10");
  }

  Future<Response?> createNewLoanInstallment( LoanInstallmentBody body,) async {
    return await apiClient.postData(AppConstants.loanInstallments, body.toJson());
  }

  Future<Response?> updateLoanInstallment( LoanInstallmentBody body, int id) async {
    return await apiClient.putData("${AppConstants.loanInstallments}/$id", body.toJson());
  }
  

  Future<Response?> deleteLoanInstallment (int id) async {
    return await apiClient.deleteData("${AppConstants.loanInstallments}/$id");
  }
}