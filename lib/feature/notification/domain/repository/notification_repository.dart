import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';

class NotificationRepository{
  final ApiClient apiClient;
  NotificationRepository({required this.apiClient});


  Future<Response?> getNotificationList(int page) async {
    return await apiClient.getData("");
  }

  Future<Response?> getNotificationDetails(String id) async {
    return await apiClient.getData("");
  }

}