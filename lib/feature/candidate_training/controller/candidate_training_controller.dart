import 'package:get/get.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/api_handle/global_api_response_model.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_body.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_model.dart';
import 'package:job/feature/candidate_training/domain/repository/candidate_training_repository.dart';

class CandidateTrainingController extends GetxController implements GetxService{
  final CandidateTrainingRepository candidateTrainingRepository;
  CandidateTrainingController({required this.candidateTrainingRepository});




  bool isLoading = false;
  ApiResponse<CandidateTrainingItem>? candidateTrainingModel;
  Future<void> getCandidateTrainingList(int offset) async {
    Response? response = await candidateTrainingRepository.getCandidateTrainingList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateTrainingItem>.fromJson(response?.body, (json)=> CandidateTrainingItem.fromJson(json));
      if(offset == 1){
        candidateTrainingModel = apiResponse;
      }else{
        candidateTrainingModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateTrainingModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateTrainingModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewCandidateTraining( CandidateTrainingBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateTrainingRepository.createNewCandidateTraining(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateTrainingList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateTraining(CandidateTrainingBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateTrainingRepository.updateCandidateTraining(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateTrainingList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateTraining(int id) async {
    isLoading = true;
    Response? response = await candidateTrainingRepository.deleteCandidateTraining(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateTrainingList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateTrainingItem? selectedCandidateTrainingItem;
  void selectCandidateTraining(CandidateTrainingItem item){
    selectedCandidateTrainingItem = item;
    update();
  }
  
}