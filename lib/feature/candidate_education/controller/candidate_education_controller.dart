import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_body.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:mighty_job/feature/candidate_education/domain/repository/candidate_education_repository.dart';

class CandidateEducationController extends GetxController implements GetxService{
  final CandidateEducationRepository candidateEducationRepository;
  CandidateEducationController({required this.candidateEducationRepository});




  bool isLoading = false;
  ApiResponse<CandidateEducationItem>? candidateEducationModel;
  Future<void> getCandidateEducationList(int offset) async {
    Response? response = await candidateEducationRepository.getCandidateEducationList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateEducationItem>.fromJson(response?.body, (json)=> CandidateEducationItem.fromJson(json));
      if(offset == 1){
        candidateEducationModel = apiResponse;
      }else{
        candidateEducationModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateEducationModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateEducationModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewCandidateEducation( CandidateEducationBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateEducationRepository.createNewCandidateEducation(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateEducationList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateEducation(CandidateEducationBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateEducationRepository.updateCandidateEducation(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateEducationList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateEducation(int id) async {
    isLoading = true;
    Response? response = await candidateEducationRepository.deleteCandidateEducation(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateEducationList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateEducationItem? selectedCandidateEducationItem;
  void selectCandidateEducation(CandidateEducationItem item){
    selectedCandidateEducationItem = item;
    update();
  }
  
}