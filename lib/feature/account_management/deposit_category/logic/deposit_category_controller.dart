
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/model/deposit_category_details_model.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/repository/deposit_category_repository.dart';

class DepositCategoryController extends GetxController implements GetxService{
  final DepositCategoryRepository depositCategoryRepository;
  DepositCategoryController({required this.depositCategoryRepository});




  bool isLoading = false;
  ApiResponse<DepositCategoryItem>? depositCategoryModel;
  Future<void> getDepositCategoryList(int offset , {String search = ""}) async {
    Response? response = await depositCategoryRepository.getDepositCategoryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponseModel = ApiResponse<DepositCategoryItem>.fromJson(response?.body, (json)=> DepositCategoryItem.fromJson(json));
      if(offset == 1){
        depositCategoryModel = apiResponseModel;
      }else{
        depositCategoryModel?.data?.data?.addAll(apiResponseModel.data?.data??[]);
        depositCategoryModel?.data?.total = apiResponseModel.data?.total;
        depositCategoryModel?.data?.currentPage = apiResponseModel.data?.currentPage;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  DepositCategoryItem? selectedCategory;
  void setSelectedCategory(DepositCategoryItem? category, {bool notify = true}) {
    selectedCategory = category;
    if(notify){
      update();
    }

  }


  DepositCategoryDetailsModel? depositCategoryDetailsModel;
  Future<void> getDepositCategoryDetails(int id ) async {
    isLoading = true;
    Response? response = await depositCategoryRepository.getDepositCategoryDetails(id);
    if (response?.statusCode == 200) {
      depositCategoryDetailsModel = DepositCategoryDetailsModel.fromJson(response?.body);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }




  Future<void> createNewDepositCategory( String name) async {
    isLoading = true;
    update();
    Response? response = await depositCategoryRepository.createDepositCategory(name);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getDepositCategoryList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateDepositCategory(String name, int id) async {
    isLoading = true;
    update();
    Response? response = await depositCategoryRepository.updateDepositCategory(name, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getDepositCategoryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteDepositCategory(int id) async {
    isLoading = true;
    Response? response = await depositCategoryRepository.deleteDepositCategory(id);
    if (response?.statusCode == 200) {
      Get.back();
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getDepositCategoryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

}