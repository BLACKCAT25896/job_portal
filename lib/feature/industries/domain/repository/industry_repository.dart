import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class IndustryRepository{
  final ApiClient apiClient;
  IndustryRepository({required this.apiClient});


  Future<Response?> getIndustryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.industries}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewIndustry(IndustryBody body) async {
    return await apiClient.postData(AppConstants.industries, body.toJson());
  }

  Future<Response?> updateIndustry(IndustryBody body, int id) async {
    return await apiClient.postData("${AppConstants.industries}/$id",
        body.toJson());
  }


  Future<Response?> deleteIndustry (int id) async {
    return await apiClient.deleteData("${AppConstants.industries}/$id");
  }
}