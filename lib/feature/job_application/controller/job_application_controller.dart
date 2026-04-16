
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_body.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_model.dart';
import 'package:mighty_job/feature/job_application/domain/repository/job_application_repository.dart';

class JobApplicationController extends GetxController implements GetxService{
  final JobApplicationRepository applicationRepository;
  JobApplicationController({required this.applicationRepository});




  bool isLoading = false;
  ApiResponse<JobApplicationItem>? applicationModel;
  Future<void> getJobApplicationList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await applicationRepository.getJobApplicationList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<JobApplicationItem>.fromJson(response?.body, (json)=>
          JobApplicationItem.fromJson(json));
      if(offset == 1){
        applicationModel = apiResponse;
      }else{
        applicationModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        applicationModel?.data?.total = apiResponse.data?.total;
        applicationModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  JobApplicationItem? selectedJobApplicationItem;
  void selectJobApplication(JobApplicationItem? item, {bool notify = true}) {
    selectedJobApplicationItem = item;
    if(notify) {
      update();
    }
  }






  Future<void> createNewJobApplication(JobApplicationBody applicationBody) async {
    isLoading = true;
    update();
    Response? response = await applicationRepository.createNewJobApplication(applicationBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getJobApplicationList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateJobApplication(JobApplicationBody applicationBody, int id) async {
    isLoading = true;
    update();
    Response? response = await applicationRepository.updateJobApplication(applicationBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getJobApplicationList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteJobApplication(int id) async {
    isLoading = true;
    Response? response = await applicationRepository.deleteJobApplication(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getJobApplicationList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}