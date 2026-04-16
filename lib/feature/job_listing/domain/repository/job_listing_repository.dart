import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class JobListingRepository{
  final ApiClient apiClient;
  JobListingRepository({required this.apiClient});


  Future<Response?> getJobListingList(int page, String search) async {
    return await apiClient.getData("${AppConstants.jobListings}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewJobListing(JobListingBody categoryBody) async {
    return await apiClient.postData(AppConstants.jobListings, categoryBody.toJson());
  }

  Future<Response?> updateJobListing(JobListingBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.jobListings}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deleteJobListing (int id) async {
    return await apiClient.deleteData("${AppConstants.jobListings}/$id");
  }
}