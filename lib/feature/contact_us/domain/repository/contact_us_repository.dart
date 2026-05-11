import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/contact_us/domain/model/contact_us_body.dart';
import 'package:job/util/app_constants.dart';

class ContactUsRepository {
  ApiClient apiClient;
  ContactUsRepository({required this.apiClient});


  Future<Response> contactUs(ContactUsBody body) async {
    return await apiClient.postData(AppConstants.frontendContactUs, body.toJson());
  }

}