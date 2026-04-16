
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_body.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_model.dart';
import 'package:mighty_job/feature/reported_job/domain/repository/reported_job_repository.dart';

class ReportedJobController extends GetxController implements GetxService{
  final ReportedJobRepository reportedJobRepository;
  ReportedJobController({required this.reportedJobRepository});




  bool isLoading = false;
  ApiResponse<ReportedJobItem>? reportedJobModel;
  Future<void> getReportedJobList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await reportedJobRepository.getReportedJobList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<ReportedJobItem>.fromJson(response?.body, (json)=>
          ReportedJobItem.fromJson(json));
      if(offset == 1){
        reportedJobModel = apiResponse;
      }else{
        reportedJobModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        reportedJobModel?.data?.total = apiResponse.data?.total;
        reportedJobModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  ReportedJobItem? selectedReportedJobItem;
  void selectReportedJob(ReportedJobItem? item, {bool notify = true}) {
    selectedReportedJobItem = item;
    if(notify) {
      update();
    }
  }






  Future<void> createNewReportedJob(ReportedJobBody reportedJobBody) async {
    isLoading = true;
    update();
    Response? response = await reportedJobRepository.createNewReportedJob(reportedJobBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getReportedJobList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateReportedJob(ReportedJobBody reportedJobBody, int id) async {
    isLoading = true;
    update();
    Response? response = await reportedJobRepository.updateReportedJob(reportedJobBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getReportedJobList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteReportedJob(int id) async {
    isLoading = true;
    Response? response = await reportedJobRepository.deleteReportedJob(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getReportedJobList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}