import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class SalaryPeriodRepository{
  final ApiClient apiClient;
  SalaryPeriodRepository({required this.apiClient});


  Future<Response?> getSalaryPeriodList(int page, String search) async {
    return await apiClient.getData("${AppConstants.salaryPeriods}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewSalaryPeriod(SalaryPeriodBody body) async {
    return await apiClient.postData(AppConstants.salaryPeriods, body.toJson());
  }

  Future<Response?> updateSalaryPeriod(SalaryPeriodBody body, int id) async {
    return await apiClient.postData("${AppConstants.salaryPeriods}/$id",
        body.toJson());
  }


  Future<Response?> deleteSalaryPeriod (int id) async {
    return await apiClient.deleteData("${AppConstants.salaryPeriods}/$id");
  }
}