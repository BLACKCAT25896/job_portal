import 'package:get/get.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/api_handle/global_api_response_model.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_body.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_model.dart';
import 'package:job/feature/candidate_certificate/domain/repository/candidate_certificate_repository.dart';

class CandidateCertificateController extends GetxController implements GetxService{
  final CandidateCertificateRepository candidateCertificateRepository;
  CandidateCertificateController({required this.candidateCertificateRepository});




  bool isLoading = false;
  ApiResponse<CandidateCertificateItem>? candidateCertificateModel;
  Future<void> getCandidateCertificateList(int offset) async {
    Response? response = await candidateCertificateRepository.getCandidateCertificateList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateCertificateItem>.fromJson(response?.body, (json)=> CandidateCertificateItem.fromJson(json));
      if(offset == 1){
        candidateCertificateModel = apiResponse;
      }else{
        candidateCertificateModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateCertificateModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateCertificateModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewCandidateCertificate( CandidateCertificateBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateCertificateRepository.createNewCandidateCertificate(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateCertificateList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateCertificate(CandidateCertificateBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateCertificateRepository.updateCandidateCertificate(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateCertificateList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateCertificate(int id) async {
    isLoading = true;
    Response? response = await candidateCertificateRepository.deleteCandidateCertificate(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateCertificateList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateCertificateItem? selectedCandidateCertificateItem;
  void selectCandidateCertificate(CandidateCertificateItem item){
    selectedCandidateCertificateItem = item;
    update();
  }
  
}