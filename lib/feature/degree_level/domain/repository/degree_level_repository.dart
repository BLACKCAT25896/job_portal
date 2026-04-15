import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/degree_level/domain/models/degree_level_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class DegreeLevelRepository{
  final ApiClient apiClient;
  DegreeLevelRepository({required this.apiClient});


  Future<Response?> getDegreeLevelList(int page, String search) async {
    return await apiClient.getData("${AppConstants.degreeLevels}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewDegreeLevel(DegreeLevelBody body) async {
    return await apiClient.postData(AppConstants.degreeLevels, body.toJson());
  }

  Future<Response?> updateDegreeLevel(DegreeLevelBody body, int id) async {
    return await apiClient.postData("${AppConstants.degreeLevels}/$id",
        body.toJson());
  }


  Future<Response?> deleteDegreeLevel (int id) async {
    return await apiClient.deleteData("${AppConstants.degreeLevels}/$id");
  }
}