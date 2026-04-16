import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class JobApplicationRepository{
  final ApiClient apiClient;
  JobApplicationRepository({required this.apiClient});


  Future<Response?> getJobApplicationList(int page, String search) async {
    return await apiClient.getData("${AppConstants.jobApplications}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewJobApplication(JobApplicationBody categoryBody) async {
    return await apiClient.postData(AppConstants.jobApplications, categoryBody.toJson());
  }

  Future<Response?> updateJobApplication(JobApplicationBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.jobApplications}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deleteJobApplication (int id) async {
    return await apiClient.deleteData("${AppConstants.jobApplications}/$id");
  }
}