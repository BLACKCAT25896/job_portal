import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ReportedJobRepository{
  final ApiClient apiClient;
  ReportedJobRepository({required this.apiClient});


  Future<Response?> getReportedJobList(int page, String search) async {
    return await apiClient.getData("${AppConstants.reportedJobs}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewReportedJob(ReportedJobBody body) async {
    return await apiClient.postData(AppConstants.reportedJobs, body.toJson());
  }

  Future<Response?> updateReportedJob(ReportedJobBody body, int id) async {
    return await apiClient.postData("${AppConstants.reportedJobs}/$id",
        body.toJson());
  }


  Future<Response?> deleteReportedJob (int id) async {
    return await apiClient.deleteData("${AppConstants.reportedJobs}/$id");
  }
}