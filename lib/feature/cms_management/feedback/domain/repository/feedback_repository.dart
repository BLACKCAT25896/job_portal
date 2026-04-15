import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/cms_management/feedback/domain/model/feedback_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class FeedbackRepository {
  final ApiClient apiClient;

  FeedbackRepository({required this.apiClient});
  
  Future<Response?> getFeedback(int page) async {
    return await apiClient.getData("${AppConstants.feedback}?page=$page");
  }

  Future<Response?> createFeedback(FeedbackBody body, XFile? file) async {
    return await apiClient.postMultipartData(AppConstants.feedback, body.toJson(), [], MultipartBody("thumbnail_image", file), []);
  }

  Future<Response?> editFeedback(FeedbackBody body, int id, XFile? file) async {
    return await apiClient.postMultipartData("${AppConstants.feedback}/$id", body.toJson(), [], MultipartBody("thumbnail_image", file), []);
  }

  Future<Response?> deleteFeedback(int id) async {
    return await apiClient.deleteData("${AppConstants.feedback}/$id");
  }
}
  