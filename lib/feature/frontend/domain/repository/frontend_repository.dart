import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LandingRepository{
  final ApiClient apiClient;
  LandingRepository({required this.apiClient});


  Future<Response?> getLandingIndustriesList(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendIndustries}?page=$page&perPage=10&search=$search");
  }

Future<Response?> getLandingCompanies(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendCompanies}?page=$page&perPage=10&search=$search");
}

  Future<Response?> getLandingSkills(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendSkills}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> getLandingJobCategories(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendJobCategories}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> getLandingJobListing(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendJobListings}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> getLandingPostCategories(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendPostCategories}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> getLandingPost(int page, String search) async {
    return await apiClient.getData("${AppConstants.frontendPost}?page=$page&perPage=10&search=$search");
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