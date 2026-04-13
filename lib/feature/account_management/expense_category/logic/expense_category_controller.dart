import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_details_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/repository/expense_category_repository.dart';

class ExpanseCategoryController extends GetxController implements GetxService{
  final ExpanseCategoryRepository expanseCategoryRepository;
  ExpanseCategoryController({required this.expanseCategoryRepository});


  bool isLoading = false;
  ApiResponse<ExpenseCategoryItem>? expenseCategoryModel;
  Future<void> getExpanseCategoryList(int offset, {String search = ""}) async {
    Response? response = await expanseCategoryRepository.getExpensesCategoryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<ExpenseCategoryItem>.fromJson(response?.body, (json)=> ExpenseCategoryItem.fromJson(json));
      if(offset == 1){
        expenseCategoryModel = apiResponse;
      }else{
        expenseCategoryModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        expenseCategoryModel?.data?.total = apiResponse.data?.total;
        expenseCategoryModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  ExpenseCategoryDetailsModel? expenseCategoryDetailsModel;
  Future<void> getExpanseCategoryDetails(int id) async {
    isLoading = true;
    Response? response = await expanseCategoryRepository.getExpensesCategoryDetails(id);
    if (response?.statusCode == 200) {
      expenseCategoryDetailsModel = ExpenseCategoryDetailsModel.fromJson(response?.body);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  ExpenseCategoryItem? selectedExpenseCategoryItem;
  void setSelectedExpenseCategoryItem(ExpenseCategoryItem? item, {bool notify = true}){
    selectedExpenseCategoryItem = item;
    if(notify){
      update();
    }
  }


  Future<void> createNewExpanseCategory( String name,) async {
    isLoading = true;
    update();
    Response? response = await expanseCategoryRepository.createNewExpensesCategory(name);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getExpanseCategoryList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateExpanseCategory(String name, int id) async {
    isLoading = true;
    update();
    Response? response = await expanseCategoryRepository.updateExpensesCategory(name, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getExpanseCategoryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteExpanseCategory(int id) async {
    isLoading = true;
    Response? response = await expanseCategoryRepository.deleteExpensesCategory(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getExpanseCategoryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

}