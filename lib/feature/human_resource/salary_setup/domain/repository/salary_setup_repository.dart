import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class SalarySetupRepository{
  final ApiClient apiClient;
  SalarySetupRepository({required this.apiClient});


  Future<Response?> getSalarySetupList(int page) async {
    return await apiClient.getData("${AppConstants.salarySetup}?page=$page&perPage=10");
  }

  Future<Response?> createNewSalarySetup(SalarySetupBody body,) async {
    return await apiClient.postData(AppConstants.salarySetup, body.toJson());
  }

  Future<Response?> updateSalarySetup(SalarySetupBody body, int id) async {
    return await apiClient.putData("${AppConstants.salarySetup}/$id", body.toJson());
  }
  

  Future<Response?> deleteSalarySetup (int id) async {
    return await apiClient.deleteData("${AppConstants.salarySetup}/$id");
  }
}