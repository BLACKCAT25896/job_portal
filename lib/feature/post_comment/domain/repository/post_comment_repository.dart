import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PostCommentRepository{
  final ApiClient apiClient;
  PostCommentRepository({required this.apiClient});


  Future<Response?> getPostCommentList(int page, String search) async {
    return await apiClient.getData("${AppConstants.posts}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewPostComment(PostCommentBody categoryBody) async {
    return await apiClient.postData(AppConstants.posts, categoryBody.toJson());
  }

  Future<Response?> updatePostComment(PostCommentBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.posts}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deletePostComment (int id) async {
    return await apiClient.deleteData("${AppConstants.posts}/$id");
  }
}