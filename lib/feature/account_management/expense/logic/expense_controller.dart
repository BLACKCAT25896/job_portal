
import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/expense/domain/model/expense_body.dart';
import 'package:ecommerce/feature/account_management/expense/domain/model/expense_model.dart';
import 'package:ecommerce/feature/account_management/expense/domain/repository/expense_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class ExpenseController extends GetxController implements GetxService{
  final ExpenseRepository expenseRepository;
  ExpenseController({required this.expenseRepository});




  bool isLoading = false;
  ApiResponse<ExpenseItem>? expenseModel;
  Future<void> getExpanseList(int offset, {String search = ""}) async {
    Response? response = await expenseRepository.getExpenseList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse.fromJson(response?.body, (json)=> ExpenseItem.fromJson(json));
      if(offset == 1){
        expenseModel = apiResponse;
      }else{
        expenseModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        expenseModel?.data?.currentPage = apiResponse.data?.currentPage;
        expenseModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }



  XFile? thumbnail;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    log("Here is image size ==> $imageSizeIs");
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      thumbnail = pickedImage;
    }
    update();
  }


  Future<void> createNewExpense(ExpenseBody expenseBody) async {
    isLoading = true;
    update();
    Response? response = await expenseRepository.createNewExpense(expenseBody, thumbnail);
    if(response!.statusCode == 200){
      thumbnail = null;
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getExpanseList(1);
      Get.find<AccountController>().getAccountList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateExpense(ExpenseBody expenseBody, int id) async {
    isLoading = true;
    update();
    Response? response = await expenseRepository.updateExpense(expenseBody,thumbnail, id);
    if(response!.statusCode == 200){
      isLoading = false;
      thumbnail = null;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getExpanseList(1);
      Get.find<AccountController>().getAccountList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteExpense(int id) async {
    isLoading = true;
    Response? response = await expenseRepository.deleteExpense(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getExpanseList(1);
      Get.find<AccountController>().getAccountList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

}