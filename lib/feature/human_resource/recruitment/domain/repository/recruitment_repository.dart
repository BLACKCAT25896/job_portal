import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class RecruitmentRepository{
  final ApiClient apiClient;
  RecruitmentRepository({required this.apiClient});


  Future<Response?> getRecruitmentList(int page) async {
    return await apiClient.getData("${AppConstants.recruitments}?page=$page&perPage=10");
  }

  Future<Response?> createNewRecruitment(RecruitmentBody body,) async {
    return await apiClient.postData(AppConstants.recruitments, body.toJson());
  }

  Future<Response?> updateRecruitment(RecruitmentBody body, int id) async {
    return await apiClient.putData("${AppConstants.recruitments}/$id", body.toJson());
  }
  

  Future<Response?> deleteRecruitment (int id) async {
    return await apiClient.deleteData("${AppConstants.recruitments}/$id");
  }
}