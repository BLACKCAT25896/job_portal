
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_body.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_model.dart';
import 'package:mighty_job/feature/salary_currency/domain/repository/salary_currency_repository.dart';

class SalaryCurrencyController extends GetxController implements GetxService{
  final SalaryCurrencyRepository salaryCurrencyRepository;
  SalaryCurrencyController({required this.salaryCurrencyRepository});



  bool isLoading = false;
  ApiResponse<SalaryCurrencyItem>? salaryCurrencyModel;
  Future<void> getSalaryCurrencyList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await salaryCurrencyRepository.getSalaryCurrencyList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SalaryCurrencyItem>.fromJson(response?.body, (json)=>
          SalaryCurrencyItem.fromJson(json));
      if(offset == 1){
        salaryCurrencyModel = apiResponse;
      }else{
        salaryCurrencyModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        salaryCurrencyModel?.data?.total = apiResponse.data?.total;
        salaryCurrencyModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  SalaryCurrencyItem? selectedSalaryCurrencyItem;
  void selectSalaryCurrency(SalaryCurrencyItem? item, {bool notify = true}) {
    selectedSalaryCurrencyItem = item;
    if(notify) {
      update();
    }
  }




  Future<void> createNewSalaryCurrency(SalaryCurrencyBody salaryCurrencyBody) async {
    isLoading = true;
    update();
    Response? response = await salaryCurrencyRepository.createNewSalaryCurrency(salaryCurrencyBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSalaryCurrencyList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateSalaryCurrency(SalaryCurrencyBody salaryCurrencyBody, int id) async {
    isLoading = true;
    update();
    Response? response = await salaryCurrencyRepository.updateSalaryCurrency(salaryCurrencyBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSalaryCurrencyList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteSalaryCurrency(int id) async {
    isLoading = true;
    Response? response = await salaryCurrencyRepository.deleteSalaryCurrency(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSalaryCurrencyList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}