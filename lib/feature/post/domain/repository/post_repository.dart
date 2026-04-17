import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/post/domain/models/post_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PostRepository{
  final ApiClient apiClient;
  PostRepository({required this.apiClient});


  Future<Response?> getPostList(int page, String search) async {
    return await apiClient.getData("${AppConstants.posts}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewPost(PostBody categoryBody) async {
    return await apiClient.postData(AppConstants.posts, categoryBody.toJson());
  }

  Future<Response?> updatePost(PostBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.posts}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deletePost (int id) async {
    return await apiClient.deleteData("${AppConstants.posts}/$id");
  }
}