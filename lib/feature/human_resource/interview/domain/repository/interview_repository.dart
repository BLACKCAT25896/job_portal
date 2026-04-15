import 'package:mighty_job/feature/human_resource/interview/domain/models/interview_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class InterviewRepository{
  final ApiClient apiClient;
  InterviewRepository({required this.apiClient});


  Future<Response?> getInterviewList(int page) async {
    return await apiClient.getData("${AppConstants.interviews}?page=$page&perPage=10");
  }

  Future<Response?> createNewInterview(InterviewBody body,) async {


    return await apiClient.postData(AppConstants.interviews, body.toJson());
  }

  Future<Response?> updateInterview(InterviewBody body, int id) async {
    return await apiClient.putData("${AppConstants.interviews}/$id", body.toJson());
  }
  

  Future<Response?> deleteInterview (int id) async {
    return await apiClient.deleteData("${AppConstants.interviews}/$id");
  }
}