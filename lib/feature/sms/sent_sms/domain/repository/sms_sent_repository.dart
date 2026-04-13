import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/sms/sent_sms/domain/model/sent_sms_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class SentSmsRepository{
  final ApiClient apiClient;
  SentSmsRepository({required this.apiClient});

  Future<Response?> sentSms(SentSmsBody body) async {
    return await apiClient.postData(AppConstants.sendSms, body.toJson());
  }

  Future<Response?> getUsersForSms(String type) async {
    return await apiClient.getData("${AppConstants.userListForSms}?user_type=$type");
  }

  Future<Response?> sentSmsReport(int page, String? from, String? to) async {
    final queryParams = {
      'per_page': '10',
      'page': page.toString(),
      if (from != null && from.isNotEmpty) 'from': from,
      if (to != null && to.isNotEmpty) 'to': to,
    };

    final queryString = Uri(queryParameters: queryParams).query;

    return await apiClient.getData("${AppConstants.smsReport}?$queryString");
  }



}