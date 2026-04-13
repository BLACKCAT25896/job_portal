import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/models/salary_type_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class SalaryTypeRepository{
  final ApiClient apiClient;
  SalaryTypeRepository({required this.apiClient});


  Future<Response?> getSalaryTypeList(int page) async {
    return await apiClient.getData("${AppConstants.salaryTypes}?page=$page&perPage=10");
  }

  Future<Response?> createNewSalaryType( SalaryTypeBody body,) async {
    return await apiClient.postData(AppConstants.salaryTypes, body.toJson());
  }

  Future<Response?> updateSalaryType( SalaryTypeBody body, int id) async {
    return await apiClient.putData("${AppConstants.salaryTypes}/$id", body.toJson());
  }
  

  Future<Response?> deleteSalaryType (int id) async {
    return await apiClient.deleteData("${AppConstants.salaryTypes}/$id");
  }
}