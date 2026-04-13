
import 'dart:developer';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_body.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_model.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/repository/deposit_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class DepositController extends GetxController implements GetxService{
  final DepositRepository depositRepository;
  DepositController({required this.depositRepository});



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

  bool isLoading = false;
  ApiResponse<DepositItem>? depositModel;
  Future<void> getDepositList(int offset, {String search = ""}) async {
    Response? response = await depositRepository.getDepositList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<DepositItem>.fromJson(response?.body, (json) => DepositItem.fromJson(json));
      if(offset == 1){
        depositModel = apiResponse;
      }else{
        depositModel?.data?.data?.addAll(apiResponse.data!.data!);
        depositModel?.data?.currentPage = apiResponse.data?.currentPage;
        depositModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  AccountItem? selectedAccountItem;
  void setSelectedAccountItem(AccountItem? accountItem, {bool notify = true}) {
    selectedAccountItem = accountItem;
    if(notify) {
      update();
    }
  }



  void initDropdown(){
    selectedAccountItem = null;
  }




  Future<void> createNewDeposit(DepositBody depositBody) async {
    isLoading = true;
    update();
    Response? response = await depositRepository.createDeposit(depositBody, thumbnail);
    if(response!.statusCode == 200){
      selectedAccountItem = null;
      isLoading = false;
      thumbnail = null;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getDepositList(1);
      Get.find<AccountController>().getAccountList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateDeposit(DepositBody depositBody, int id) async {
    isLoading = true;
    update();
    Response? response = await depositRepository.updateDeposit(depositBody,thumbnail, id);
    if(response!.statusCode == 200){
      isLoading = false;
      thumbnail = null;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getDepositList(1);
      Get.find<AccountController>().getAccountList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteDeposit(int id) async {
    isLoading = true;
    Response? response = await depositRepository.deleteDeposit(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getDepositList(1);
      Get.find<AccountController>().getAccountList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


}