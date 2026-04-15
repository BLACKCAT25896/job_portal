import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/career_level/domain/models/career_level_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CareerLevelRepository{
  final ApiClient apiClient;
  CareerLevelRepository({required this.apiClient});


  Future<Response?> getCareerLevelList(int page, String search) async {
    return await apiClient.getData("${AppConstants.careerLevels}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewCareerLevel(CareerLevelBody body) async {
    return await apiClient.postData(AppConstants.careerLevels, body.toJson());
  }

  Future<Response?> updateCareerLevel(CareerLevelBody body, int id) async {
    return await apiClient.postData("${AppConstants.careerLevels}/$id",
        body.toJson());
  }


  Future<Response?> deleteCareerLevel (int id) async {
    return await apiClient.deleteData("${AppConstants.careerLevels}/$id");
  }
}