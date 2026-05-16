import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/job_listing/domain/models/post_a_job_body.dart';
import 'package:job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class JobListingRepository{
  final ApiClient apiClient;
  JobListingRepository({required this.apiClient});


  Future<Response?> getJobListingList(int page, String search) async {
    return await apiClient.getData("${AppConstants.jobListings}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> getCompanyJobListingList(int page, String search) async {
    return await apiClient.getData("${AppConstants.companyJobs}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewJobListing(PostAJobBody categoryBody) async {
    return await apiClient.postData(AppConstants.jobListings, categoryBody.toJson());
  }

  Future<Response?> updateJobListing(PostAJobBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.jobListings}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deleteJobListing (int id) async {
    return await apiClient.deleteData("${AppConstants.jobListings}/$id");
  }
}