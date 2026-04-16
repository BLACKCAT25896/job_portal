import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_body.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:mighty_job/feature/candidate_resume/domain/repository/candidate_resume_repository.dart';

class CandidateResumeController extends GetxController implements GetxService{
  final CandidateResumeRepository candidateResumeRepository;
  CandidateResumeController({required this.candidateResumeRepository});




  bool isLoading = false;
  ApiResponse<CandidateResumeItem>? candidateResumeModel;
  Future<void> getCandidateResumeList(int offset) async {
    Response? response = await candidateResumeRepository.getCandidateResumeList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateResumeItem>.fromJson(response?.body, (json)=> CandidateResumeItem.fromJson(json));
      if(offset == 1){
        candidateResumeModel = apiResponse;
      }else{
        candidateResumeModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateResumeModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateResumeModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  bool isCurrentlyWorking = false;
  void toggleCurrentlyWorking({bool? value}){
    isCurrentlyWorking = value?? !isCurrentlyWorking;
    update();
  }


  Future<void> createNewCandidateResume( CandidateResumeBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateResumeRepository.createNewCandidateResume(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateResumeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateResume(CandidateResumeBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateResumeRepository.updateCandidateResume(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateResumeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateResume(int id) async {
    isLoading = true;
    Response? response = await candidateResumeRepository.deleteCandidateResume(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateResumeList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateResumeItem? selectedCandidateResumeItem;
  void selectCandidateResume(CandidateResumeItem item){
    selectedCandidateResumeItem = item;
    update();
  }
  
}