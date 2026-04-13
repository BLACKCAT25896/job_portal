import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/fund/domain/model/fund_body.dart';
import 'package:ecommerce/feature/account_management/fund/domain/model/fund_model.dart';
import 'package:ecommerce/feature/account_management/fund/domain/repository/fund_repository.dart';

class FundController extends GetxController implements GetxService {
  final FundRepository fundRepository;
  FundController({required this.fundRepository});


  bool isLoading = false;
  ApiResponse<FundItem>? fundModel;
  Future<void> getFund(int page) async {
    Response? response = await fundRepository.getFund(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<FundItem>.fromJson(response?.body, (json)=> FundItem.fromJson(json));
      if(page == 1){
        fundModel = apiResponse;
      }else{
        fundModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        fundModel?.data?.total = apiResponse.data?.total;
        fundModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  FundItem? selectedFundItem;
  void setSelectFundItem(FundItem item, {bool notify = true}){
    selectedFundItem = item;
    if(notify) {
      update();
    }
  }

  Future<void> createFund(FundBody body) async {
    isLoading = true;
    update();
    Response? response = await fundRepository.createFund(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getFund(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editFund(FundBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await fundRepository.editFund(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getFund(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteFund(int id) async {
    Response? response = await fundRepository.deleteFund(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getFund(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }
}
  