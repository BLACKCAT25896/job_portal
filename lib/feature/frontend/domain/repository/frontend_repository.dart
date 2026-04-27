import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LandingRepository{
  final ApiClient apiClient;
  LandingRepository({required this.apiClient});


  Future<Response?> getLandingJobListingSummery() async {
    return await apiClient.getData(AppConstants.frontendJobListingSummery);
  }
  Future<Response?> getLandingIndustriesList(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendIndustries}?page=$page&perPage=50&search=$search");
  }

Future<Response?> getLandingCompanies(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendCompanies}?page=$page&perPage=50&search=$search");
}

  Future<Response?> getLandingSkills(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendSkills}?page=$page&perPage=50&search=$search");
  }

  Future<Response?> getLandingJobCategories(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendJobCategories}?page=$page&perPage=50&search=$search");
  }

  Future<Response?> getLandingJobListing({
    int? page,
    String? search,
    int? companyId,
    String? jobCategoryId,
    int? careerLevelId,
    int? degreeLevelId,
    int? salaryFrom,
    int? salaryTo,
    int? status,
    String? sortBy,
    String? sortOrder,
    int? countryId,
    int? stateId,
    int? cityId,
  }) async {

    final Map<String, String> queryParams = {};

    void addParam(String key, dynamic value) {
      if (value != null) {
        if (value is String && value.isEmpty) return;
        queryParams[key] = value.toString(); // 🔥 FIX
      }
    }

    addParam('page', page);
    addParam('per_page', 50);
    addParam('search', search);
    addParam('company_id', companyId);
    addParam('job_category_id', jobCategoryId);
    addParam('career_level_id', careerLevelId);
    addParam('degree_level_id', degreeLevelId);
    addParam('salary_from', salaryFrom);
    addParam('salary_to', salaryTo);
    addParam('status', status);
    addParam('sort_by', sortBy);
    addParam('sort_order', sortOrder);
    addParam('country_id', countryId);
    addParam('state_id', stateId);
    addParam('city_id', cityId);

    final uri = Uri.parse(AppConstants.frontendJobListings)
        .replace(queryParameters: queryParams);

    return await apiClient.getData(uri.toString());
  }

  Future<Response?> getLandingJobDetails(String id) async {
    return await apiClient.getData("${AppConstants.frontendJobListings}/$id");
  }

  Future<Response?> getLandingPostCategories(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendPostCategories}?page=$page&perPage=50&search=$search");
  }

  Future<Response?> getLandingPost(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendPost}?page=$page&perPage=50&search=$search");
  }


  Future<Response> privacyPolicy() async {
    return await apiClient.getData(AppConstants.frontendPrivacyPolicy);
  }

  Future<Response> termsAndCondition() async {
    return await apiClient.getData(AppConstants.frontendTermsCondition);
  }

  Future<Response> cookiePolicy() async {
    return await apiClient.getData(AppConstants.frontendCookiePolicy);
  }

  Future<Response> aboutUs() async {
    return await apiClient.getData(AppConstants.frontendAboutUs);
  }

  Future<Response> newsLetter(String email) async {
    return await apiClient.postData(AppConstants.frontendContactUs, {"email": email});
  }


}