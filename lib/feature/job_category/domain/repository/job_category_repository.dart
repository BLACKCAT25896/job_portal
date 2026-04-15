import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class JobCategoryRepository{
  final ApiClient apiClient;
  JobCategoryRepository({required this.apiClient});


  Future<Response?> getJobCategoryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.jobCategories}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewJobCategory(JobCategoryBody categoryBody) async {
    return await apiClient.postData(AppConstants.jobCategories, categoryBody.toJson());
  }

  Future<Response?> updateJobCategory(JobCategoryBody categoryBody, int id) async {
    return await apiClient.postData("${AppConstants.jobCategories}/$id",
        categoryBody.toJson());
  }


  Future<Response?> deleteJobCategory (int id) async {
    return await apiClient.deleteData("${AppConstants.jobCategories}/$id");
  }
}