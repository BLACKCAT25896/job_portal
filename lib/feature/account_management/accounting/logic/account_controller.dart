import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_body_model.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/repository/account_repository.dart';

class AccountController extends GetxController implements GetxService{
  final AccountRepository accountRepository;
  AccountController({required this.accountRepository});




  bool isLoading = false;
  int accountId = 0;
  double balance = 0;
  ApiResponse<AccountItem>? accountModel;
  Future<void> getAccountList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await accountRepository.getAccountList(offset, search: search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<AccountItem>.fromJson(response?.body, (json)=> AccountItem.fromJson(json));
      if(offset == 1){
        accountModel = apiResponse;
      }else{
        accountModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        accountModel?.data?.total = apiResponse.data?.total;
        accountModel?.data?.currentPage = apiResponse.data?.currentPage;
      }

        // if(accountModel != null){
        //   accountId = accountModel?.data?.data?.first.id??0;
        //   balance = accountModel?.metadata?.totalBalance??0;
        // }
        //

      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  List<String> filterTypes = ["id", "account_name", "account_number", "date", "amount"];
  String selectedFilterType = "id";
  void setSelectFilterType(String type) {
    selectedFilterType = type;
    update();
  }
  List<String> sortTypes = ["asc", "desc"];
  String selectedSortType = "desc";
  void setSelectSortType(String type) {
    selectedSortType = type;
    update();
  }



  List<String> accountTypes = ["asset","liability","equity","income","expense"];
  String? selectedAccountType;
  void setSelectAccountTypeType(String type) {
    selectedAccountType = type;
    update();
  }


  void initSelectedAccount(){
    selectedAccountItem = null;
    toSelectedAccountItem = null;
  }

  AccountItem? selectedAccountItem;
  AccountItem? toSelectedAccountItem;
  void selectAccount(AccountItem accountItem, {bool isTo= false}) {
    if(isTo){
      toSelectedAccountItem = accountItem;
    }else{
      selectedAccountItem = accountItem;
    }
    update();
  }






  List<String> transactionTypes = ["cash_in", "cash_out"];
  int selectedTransactionTypeIndex = 0;
  void setSelectTransactionTypeIndex(int index){
    selectedTransactionTypeIndex = index;
    update();
  }




  Future<Response> createNewAccount( AccountBodyModel accountBody, {bool isSync = false}) async {
    isLoading = true;
    update();
    Response? response = await accountRepository.createNewAccount(accountBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getAccountList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
    return response;

  }

  Future<void> updateAccount(AccountBodyModel accountBody, int id) async {
    isLoading = true;
    update();
    Response? response = await accountRepository.updateAccount(accountBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getAccountList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteAccount(int id) async {
    isLoading = true;
    Response? response = await accountRepository.deleteAccount(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getAccountList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

}