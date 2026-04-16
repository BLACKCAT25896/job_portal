import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/feature/report_management/domain/repository/report_repository.dart';

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


}


