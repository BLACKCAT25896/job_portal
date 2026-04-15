import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/companySize/domain/models/company_size_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CompanySizeRepository{
  final ApiClient apiClient;
  CompanySizeRepository({required this.apiClient});


  Future<Response?> getCompanySizeList(int page, String search) async {
    return await apiClient.getData("${AppConstants.companySizes}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewCompanySize(CompanySizeBody body) async {
    return await apiClient.postData(AppConstants.companySizes, body.toJson());
  }

  Future<Response?> updateCompanySize(CompanySizeBody body, int id) async {
    return await apiClient.postData("${AppConstants.companySizes}/$id",
        body.toJson());
  }


  Future<Response?> deleteCompanySize (int id) async {
    return await apiClient.deleteData("${AppConstants.companySizes}/$id");
  }
}