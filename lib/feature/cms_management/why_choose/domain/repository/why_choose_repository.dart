import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/cms_management/why_choose/domain/model/why_choose_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class WhyChooseRepository {
  final ApiClient apiClient;

  WhyChooseRepository({required this.apiClient});
  
  Future<Response?> getWhyChooseUs(int page) async {
    return await apiClient.getData("${AppConstants.whyChooseUs}?page=$page");
  }

  Future<Response?> createWhyChooseUs(WhyChooseBody body, XFile? icon) async {

    return await apiClient.postMultipartData(AppConstants.whyChooseUs, body.toJson(), [],MultipartBody("icon", icon),[]);
  }

  Future<Response?> editWhyChooseUs(WhyChooseBody body, int id, XFile? icon) async {
    return await apiClient.postMultipartData("${AppConstants.whyChooseUs}/$id", body.toJson(), [],MultipartBody("icon", icon),[]);
  }

  Future<Response?> deleteWhyChooseUs(int id) async {
    return await apiClient.getData("${AppConstants.whyChooseUs}/$id");
  }
}
  