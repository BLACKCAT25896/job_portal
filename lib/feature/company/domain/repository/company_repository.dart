import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/company/domain/models/company_body.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CompanyRepository{
  final ApiClient apiClient;
  CompanyRepository({required this.apiClient});


  Future<Response?> getCompanyList(int page, String search) async {
    return await apiClient.getData("${AppConstants.companies}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewCompany(CompanyBody body) async {
    return await apiClient.postData(AppConstants.companies, body.toJson());
  }

  Future<Response?> updateCompany(CompanyBody body, int id) async {
    return await apiClient.postData("${AppConstants.companies}/$id",
        body.toJson());
  }


  Future<Response?> deleteCompany (int id) async {
    return await apiClient.deleteData("${AppConstants.companies}/$id");
  }
}