import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class JobStageRepository{
  final ApiClient apiClient;
  JobStageRepository({required this.apiClient});


  Future<Response?> getJobStageList(int page, String search) async {
    return await apiClient.getData("${AppConstants.jobStages}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewJobStage(JobStageBody categoryBody) async {
    return await apiClient.postData(AppConstants.jobStages, categoryBody.toJson());
  }

  Future<Response?> updateJobStage(JobStageBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.jobStages}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deleteJobStage (int id) async {
    return await apiClient.deleteData("${AppConstants.jobStages}/$id");
  }
}