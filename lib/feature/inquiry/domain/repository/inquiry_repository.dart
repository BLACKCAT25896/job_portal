import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/inquiry/domain/models/inquiry_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class InquiryRepository{
  final ApiClient apiClient;
  InquiryRepository({required this.apiClient});


  Future<Response?> getInquiryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.inquiries}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewInquiry(InquiryBody body) async {
    return await apiClient.postData(AppConstants.inquiries, body.toJson());
  }

  Future<Response?> updateInquiry(InquiryBody body, int id) async {
    return await apiClient.postData("${AppConstants.inquiries}/$id",
        body.toJson());
  }


  Future<Response?> deleteInquiry (int id) async {
    return await apiClient.deleteData("${AppConstants.inquiries}/$id");
  }
}