import 'package:ecommerce/feature/human_resource/loan/domain/models/loan_body.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/loan/domain/models/loan_model.dart';
import 'package:ecommerce/feature/human_resource/loan/domain/repository/loan_repository.dart';

class LoanController extends GetxController implements GetxService{
  final LoanRepository loanRepository;
  LoanController({required this.loanRepository});




  bool isLoading = false;
  ApiResponse<LoanItem>? loanModel;
  Future<void> getLoanList(int offset) async {
    Response? response = await loanRepository.getLoanList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<LoanItem>.fromJson(response?.body, (json)=> LoanItem.fromJson(json));
      if(offset == 1){
        loanModel = apiResponse;
      }else{
        loanModel?.data?.data?.addAll(apiResponse.data!.data!);
        loanModel?.data?.currentPage = apiResponse.data?.currentPage;
        loanModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewLoan( LoanBody body,) async {
    isLoading = true;
    update();
    Response? response = await loanRepository.createNewLoan(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getLoanList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateLoan( LoanBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await loanRepository.updateLoan(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLoanList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteLoan(int id) async {
    isLoading = true;
    Response? response = await loanRepository.deleteLoan(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getLoanList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  LoanItem? selectedLoanItem;
  void selectLoan(LoanItem item, {bool notify = true}){
    selectedLoanItem = item;
    if(notify) {
      update();
    }
  }
  
}