
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_body.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_model.dart';
import 'package:mighty_job/feature/job_stage/domain/repository/job_stage_repository.dart';

class JobStageController extends GetxController implements GetxService{
  final JobStageRepository stageRepository;
  JobStageController({required this.stageRepository});




  bool isLoading = false;
  ApiResponse<JobStageItem>? stageModel;
  Future<void> getJobStageList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await stageRepository.getJobStageList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<JobStageItem>.fromJson(response?.body, (json)=>
          JobStageItem.fromJson(json));
      if(offset == 1){
        stageModel = apiResponse;
      }else{
        stageModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        stageModel?.data?.total = apiResponse.data?.total;
        stageModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  JobStageItem? selectedJobStageItem;
  void selectJobStage(JobStageItem? item, {bool notify = true}) {
    selectedJobStageItem = item;
    if(notify) {
      update();
    }
  }






  Future<void> createNewJobStage(JobStageBody stageBody) async {
    isLoading = true;
    update();
    Response? response = await stageRepository.createNewJobStage(stageBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getJobStageList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateJobStage(JobStageBody stageBody, int id) async {
    isLoading = true;
    update();
    Response? response = await stageRepository.updateJobStage(stageBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getJobStageList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteJobStage(int id) async {
    isLoading = true;
    Response? response = await stageRepository.deleteJobStage(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getJobStageList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}