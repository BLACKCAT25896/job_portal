import 'package:ecommerce/feature/human_resource/loan_installment/domain/models/loan_installment_body.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/models/loan_installment_model.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/repository/loan_installment_repository.dart';

class LoanInstallmentController extends GetxController implements GetxService{
  final LoanInstallmentRepository loanInstallmentRepository;
  LoanInstallmentController({required this.loanInstallmentRepository});




  bool isLoading = false;
  ApiResponse<LoanInstallmentItem>? loanInstallmentModel;
  Future<void> getLoanInstallmentList(int offset) async {
    Response? response = await loanInstallmentRepository.getLoanInstallmentList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<LoanInstallmentItem>.fromJson(response?.body, (json)=> LoanInstallmentItem.fromJson(json));
      if(offset == 1){
        loanInstallmentModel = apiResponse;
      }else{
        loanInstallmentModel?.data?.data?.addAll(apiResponse.data!.data!);
        loanInstallmentModel?.data?.currentPage = apiResponse.data?.currentPage;
        loanInstallmentModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewLoanInstallment( LoanInstallmentBody body,) async {
    isLoading = true;
    update();
    Response? response = await loanInstallmentRepository.createNewLoanInstallment(body);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getLoanInstallmentList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateLoanInstallment(LoanInstallmentBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await loanInstallmentRepository.updateLoanInstallment(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLoanInstallmentList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteLoanInstallment(int id) async {
    isLoading = true;
    Response? response = await loanInstallmentRepository.deleteLoanInstallment(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getLoanInstallmentList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  LoanInstallmentItem? selectedLoanInstallmentItem;
  void selectLoanInstallment(LoanInstallmentItem item){
    selectedLoanInstallmentItem = item;
    update();
  }
  
}