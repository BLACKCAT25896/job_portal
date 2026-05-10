import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/util/app_constants.dart';

class ReportRepository{
  final ApiClient apiClient;
  ReportRepository({required this.apiClient});

  Future<Response> getDashboardReport() async {
    return await apiClient.getData(AppConstants.dashboardReport);
  }

}
