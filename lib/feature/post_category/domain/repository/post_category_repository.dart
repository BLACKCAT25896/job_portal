import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PostCategoryRepository{
  final ApiClient apiClient;
  PostCategoryRepository({required this.apiClient});


  Future<Response?> getPostCategoryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.postCategories}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewPostCategory(PostCategoryBody categoryBody) async {
    return await apiClient.postData(AppConstants.postCategories, categoryBody.toJson());
  }

  Future<Response?> updatePostCategory(PostCategoryBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.postCategories}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deletePostCategory (int id) async {
    return await apiClient.deleteData("${AppConstants.postCategories}/$id");
  }
}