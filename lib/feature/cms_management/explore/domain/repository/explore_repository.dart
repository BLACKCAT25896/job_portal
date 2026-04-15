import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class ExploreRepository {
  final ApiClient apiClient;

  ExploreRepository({required this.apiClient});
  
  Future<Response?> getExplore(int page) async {
    return await apiClient.getData("${AppConstants.explore}?page=$page");
  }

  Future<Response?> createExplore(String title, String description, XFile? file) async {
    return await apiClient.postMultipartData(AppConstants.explore,{
      "title": title,
      "description": description,
    },[], MultipartBody("image", file), []);
  }

  Future<Response?> editExplore(String title, String description, XFile? file, int id) async {
    return await apiClient.postMultipartData("${AppConstants.explore}/$id",
        {
          "title": title,
          "description": description,
          "_method": "put"
        },
        [], MultipartBody("image", file), []);
  }



  Future<Response?> deleteExplore(int id) async {
    return await apiClient.deleteData("${AppConstants.explore}/$id");
  }
}
  