import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/models/salary_generate_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class SalaryGenerateRepository{
  final ApiClient apiClient;
  SalaryGenerateRepository({required this.apiClient});


  Future<Response?> getSalaryGenerateList(int page) async {
    return await apiClient.getData("${AppConstants.salaryGenerate}?page=$page&perPage=10");
  }

  Future<Response?> createNewSalaryGenerate(SalaryGenerateBody body,) async {
    return await apiClient.postData(AppConstants.salaryGenerate, body.toJson());
  }

  Future<Response?> updateSalaryGenerate(SalaryGenerateBody body, int id) async {
    return await apiClient.putData("${AppConstants.salaryGenerate}/$id", body.toJson());
  }
  

  Future<Response?> deleteSalaryGenerate (int id) async {
    return await apiClient.deleteData("${AppConstants.salaryGenerate}/$id");
  }
}