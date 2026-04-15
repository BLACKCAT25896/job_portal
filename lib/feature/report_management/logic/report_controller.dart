import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:ecommerce/feature/report_management/domain/model/opening_stock_report_model.dart';
import 'package:ecommerce/feature/report_management/domain/model/stock_report_model.dart';
import 'package:ecommerce/feature/report_management/domain/repository/report_repository.dart';

class ReportController extends GetxController implements GetxService{
  final ReportRepository reportRepository;
  ReportController({required this.reportRepository});



  DashboardReportModel? dashboardReportModel;
  Future<void> getDashboardReport() async {
    Response response = await reportRepository.getDashboardReport();
    if (response.statusCode == 200) {
      dashboardReportModel = DashboardReportModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }

  String selectedReportOverviewType = "monthly";
  List<String> reportOverviewTypes = ["daily", "weekly", "monthly"];
  void updateSelectedReportOverviewType(String type) {
    selectedReportOverviewType = type;
    update();
  }



  ApiResponse<StockReportItem>? stockReportModel;
  Future<void> getStockReport(int page, {String? startDate, String? endDate}) async {
    Response response = await reportRepository.getStockReport(page, startDate: startDate, endDate: endDate);
    if (response.statusCode == 200) {
      final apiResponse = ApiResponse<StockReportItem>.fromJson(response.body, (json)=> StockReportItem.fromJson(json));
      if(page == 1){
        stockReportModel = apiResponse;
      }else{
        stockReportModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        stockReportModel?.data?.total = apiResponse.data?.total;
        stockReportModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      }else{
      ApiChecker.checkApi(response);
    }
    update();
    }




  OpeningStockReportModel? openingStockReportModel;
  Future<void> getStockOpeningReport() async {
    Response response = await reportRepository.getOpeningStockReport(Get.find<DatePickerController>().formatedFromDate,
        Get.find<DatePickerController>().formatedToDate);
    if (response.statusCode == 200) {
      openingStockReportModel = OpeningStockReportModel.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    update();
  }



}


