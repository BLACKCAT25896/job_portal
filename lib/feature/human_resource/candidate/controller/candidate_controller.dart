import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/models/candidate_body.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/models/candidate_model.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/repository/candidate_repository.dart';

class CandidateController extends GetxController implements GetxService{
  final CandidateRepository candidateRepository;
  CandidateController({required this.candidateRepository});




  bool isLoading = false;
  ApiResponse<CandidateItem>? candidateModel;
  Future<void> getCandidateList(int offset) async {
    Response? response = await candidateRepository.getCandidateList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateItem>.fromJson(response?.body, (json)=> CandidateItem.fromJson(json));
      if(offset == 1){
        candidateModel = apiResponse;
      }else{
        candidateModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewCandidate( CandidateBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateRepository.createNewCandidate(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidate(CandidateBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateRepository.updateCandidate(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidate(int id) async {
    isLoading = true;
    Response? response = await candidateRepository.deleteCandidate(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateItem? selectedCandidateItem;
  void selectCandidate(CandidateItem item){
    selectedCandidateItem = item;
    update();
  }
  
}