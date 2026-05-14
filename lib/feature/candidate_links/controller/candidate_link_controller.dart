import 'package:get/get.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/api_handle/global_api_response_model.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_body.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_model.dart';
import 'package:job/feature/candidate_links/domain/repository/candidate_link_repository.dart';

class CandidateLinkController extends GetxController implements GetxService{
  final CandidateLinkRepository candidateLinkRepository;
  CandidateLinkController({required this.candidateLinkRepository});




  bool isLoading = false;
  ApiResponse<CandidateLinkItem>? candidateLinkModel;
  Future<void> getCandidateLinkList(int offset) async {
    Response? response = await candidateLinkRepository.getCandidateLinkList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateLinkItem>.fromJson(response?.body, (json)=> CandidateLinkItem.fromJson(json));
      if(offset == 1){
        candidateLinkModel = apiResponse;
      }else{
        candidateLinkModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateLinkModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateLinkModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewCandidateLink(CandidateLinkBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateLinkRepository.createNewCandidateLink(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateLinkList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateLink(CandidateLinkBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateLinkRepository.updateCandidateLink(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateLinkList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateLink(int id) async {
    isLoading = true;
    Response? response = await candidateLinkRepository.deleteCandidateLink(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateLinkList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateLinkItem? selectedCandidateLinkItem;
  void selectCandidateLink(CandidateLinkItem item){
    selectedCandidateLinkItem = item;
    update();
  }
  
}