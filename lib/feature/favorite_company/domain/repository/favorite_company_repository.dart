import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/favorite_company/domain/models/favorite_company_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class FavoriteCompanyRepository{
  final ApiClient apiClient;
  FavoriteCompanyRepository({required this.apiClient});


  Future<Response?> getFavoriteCompanyList(int page, String search) async {
    return await apiClient.getData("${AppConstants.favoriteCompanies}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewFavoriteCompany(FavoriteCompanyBody body) async {
    return await apiClient.postData(AppConstants.favoriteCompanies, body.toJson());
  }

  Future<Response?> updateFavoriteCompany(FavoriteCompanyBody body, int id) async {
    return await apiClient.postData("${AppConstants.favoriteCompanies}/$id",
        body.toJson());
  }


  Future<Response?> deleteFavoriteCompany (int id) async {
    return await apiClient.deleteData("${AppConstants.favoriteCompanies}/$id");
  }
}