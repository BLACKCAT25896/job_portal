import 'package:get/get.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/api_handle/global_api_response_model.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_body.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_model.dart';
import 'package:job/feature/candidate_reference/domain/repository/candidate_reference_repository.dart';

class CandidateReferenceController extends GetxController implements GetxService{
  final CandidateReferenceRepository candidateReferenceRepository;
  CandidateReferenceController({required this.candidateReferenceRepository});




  bool isLoading = false;
  ApiResponse<CandidateReferenceItem>? candidateReferenceModel;
  Future<void> getCandidateReferenceList(int offset) async {
    Response? response = await candidateReferenceRepository.getCandidateReferenceList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateReferenceItem>.fromJson(response?.body, (json)=> CandidateReferenceItem.fromJson(json));
      if(offset == 1){
        candidateReferenceModel = apiResponse;
      }else{
        candidateReferenceModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateReferenceModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateReferenceModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewCandidateReference( CandidateReferenceBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateReferenceRepository.createNewCandidateReference(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateReferenceList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateReference(CandidateReferenceBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateReferenceRepository.updateCandidateReference(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateReferenceList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateReference(int id) async {
    isLoading = true;
    Response? response = await candidateReferenceRepository.deleteCandidateReference(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateReferenceList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateReferenceItem? selectedCandidateReferenceItem;
  void selectCandidateReference(CandidateReferenceItem item){
    selectedCandidateReferenceItem = item;
    update();
  }
  
}