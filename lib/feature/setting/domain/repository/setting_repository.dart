import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class SettingRepository{
  final ApiClient apiClient;
  SettingRepository({required this.apiClient});

  Future<Response?> storageUnLink() async {
    return await apiClient.getData(AppConstants.storageUnLink);
  }

  Future<Response?> storageLink() async {
    return await apiClient.getData(AppConstants.storageLink);
  }

  Future<Response?> clearCache() async {
    return await apiClient.getData(AppConstants.clearCache);
  }


}