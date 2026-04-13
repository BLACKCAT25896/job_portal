import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_body.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/repository/purchase_repository.dart';

class PurchaseController extends GetxController implements GetxService {
  final PurchaseRepository purchaseRepository;
  PurchaseController({required this.purchaseRepository});


  bool isLoading = false;
  ApiResponse<PurchaseItem>? purchaseModel;
  Future<void> getPurchase(int page) async {
    Response? response = await purchaseRepository.getPurchase(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PurchaseItem>.fromJson(response?.body, (json)=> PurchaseItem.fromJson(json));
      if(page == 1){
        purchaseModel = apiResponse;
      }else{
        purchaseModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        purchaseModel?.data?.total = apiResponse.data?.total;
        purchaseModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  PurchaseItem? selectedPurchaseItem;
  void setSelectPurchaseItem(PurchaseItem item, {bool notify = true}){
    selectedPurchaseItem = item;
    if(notify) {
      update();
    }
  }



  Future<void> createPurchase(PurchaseBody body) async {
    isLoading = true;
    update();
    Response? response = await purchaseRepository.createPurchase(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getPurchase(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editPurchase(PurchaseBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await purchaseRepository.editPurchase(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPurchase(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deletePurchase(int id) async {
    Response? response = await purchaseRepository.deletePurchase(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getPurchase(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


}
  