import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class ReportRepository{
  final ApiClient apiClient;
  ReportRepository({required this.apiClient});

  Future<Response> getDashboardReport() async {
    return await apiClient.getData(AppConstants.dashboardReport);
  }

  Future<Response> getStockReport(int page , {String? startDate, String? endDate}) async {
    if(startDate != null && endDate != null){
      return await apiClient.getData("${AppConstants.stockReport}?page=$page&perPage=10&start_date=$startDate&end_date=$endDate");
    }else {
      return await apiClient.getData("${AppConstants.stockReport}?page=$page&perPage=10");
    }
  }

  Future<Response> getPurchaseReport(int page, {String? startDate, String? endDate}) async {
    if(startDate != null && endDate != null) {
      return await apiClient.getData("${AppConstants.purchaseReport}?page=$page&perPage=10&start_date=$startDate&end_date=$endDate");
    }else {
      return await apiClient.getData("${AppConstants.purchaseReport}?page=$page&perPage=10");
    }
  }

  Future<Response> getPurchaseEstimateReport() async {
    return await apiClient.getData(AppConstants.purchaseEstimateReport);
  }

  Future<Response> getOpeningStockReport(String startDate, String endDate) async {
    return await apiClient.getData("${AppConstants.openingStockReport}?start_date=$startDate&end_date=$endDate");
  }
}
