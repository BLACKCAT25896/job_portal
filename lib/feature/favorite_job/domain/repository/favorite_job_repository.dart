import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/favorite_job/domain/models/favorite_job_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class FavoriteJobRepository{
  final ApiClient apiClient;
  FavoriteJobRepository({required this.apiClient});


  Future<Response?> getFavoriteJobList(int page, String search) async {
    return await apiClient.getData("${AppConstants.favoriteJobs}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewFavoriteJob(FavoriteJobBody categoryBody) async {
    return await apiClient.postData(AppConstants.favoriteJobs, categoryBody.toJson());
  }

  Future<Response?> updateFavoriteJob(FavoriteJobBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.favoriteJobs}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deleteFavoriteJob (int id) async {
    return await apiClient.deleteData("${AppConstants.favoriteJobs}/$id");
  }
}