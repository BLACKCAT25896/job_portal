import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_body.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:mighty_job/feature/candidate_experience/domain/repository/candidate_experience_repository.dart';

class CandidateExperienceController extends GetxController implements GetxService{
  final CandidateExperienceRepository candidateExperienceRepository;
  CandidateExperienceController({required this.candidateExperienceRepository});




  bool isLoading = false;
  ApiResponse<CandidateExperienceItem>? candidateExperienceModel;
  Future<void> getCandidateExperienceList(int offset) async {
    Response? response = await candidateExperienceRepository.getCandidateExperienceList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateExperienceItem>.fromJson(response?.body, (json)=> CandidateExperienceItem.fromJson(json));
      if(offset == 1){
        candidateExperienceModel = apiResponse;
      }else{
        candidateExperienceModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateExperienceModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateExperienceModel?.data?.total = apiResponse.data?.total;
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


  Future<void> createNewCandidateExperience( CandidateExperienceBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateExperienceRepository.createNewCandidateExperience(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateExperienceList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateExperience(CandidateExperienceBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateExperienceRepository.updateCandidateExperience(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateExperienceList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateExperience(int id) async {
    isLoading = true;
    Response? response = await candidateExperienceRepository.deleteCandidateExperience(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateExperienceList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateExperienceItem? selectedCandidateExperienceItem;
  void selectCandidateExperience(CandidateExperienceItem item){
    selectedCandidateExperienceItem = item;
    update();
  }
  
}