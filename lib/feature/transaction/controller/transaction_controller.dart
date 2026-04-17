
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/transaction/domain/models/transaction_model.dart';
import 'package:mighty_job/feature/transaction/domain/repository/transaction_repository.dart';

class TransactionController extends GetxController implements GetxService{
  final TransactionRepository transactionRepository;
  TransactionController({required this.transactionRepository});



  bool isLoading = false;
  ApiResponse<TransactionItem>? transactionModel;
  Future<void> getTransactionList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await transactionRepository.getTransactionList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<TransactionItem>.fromJson(response?.body, (json)=>
          TransactionItem.fromJson(json));
      if(offset == 1){
        transactionModel = apiResponse;
      }else{
        transactionModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        transactionModel?.data?.total = apiResponse.data?.total;
        transactionModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }






  Future<void> deleteTransaction(int id) async {
    isLoading = true;
    Response? response = await transactionRepository.deleteTransaction(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getTransactionList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}