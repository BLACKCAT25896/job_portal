import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/tax_management/tax/domain/model/tax_body.dart';
import 'package:mighty_job/feature/tax_management/tax/domain/model/tax_model.dart';
import 'package:mighty_job/feature/tax_management/tax/domain/repository/tax_repository.dart';

class TaxController extends GetxController implements GetxService {
  final TaxRepository taxRepository;
  TaxController({required this.taxRepository});


  bool isLoading = false;
  ApiResponse<TaxItem>? taxModel;
  Future<void> getTax(int page) async {
    Response? response = await taxRepository.getTax(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<TaxItem>.fromJson(response?.body, (json)=> TaxItem.fromJson(json));
      if(page == 1){
        taxModel = apiResponse;
      }else{
        taxModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        taxModel?.data?.total = apiResponse.data?.total;
        taxModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  TaxItem? selectedTaxItem;
  void setSelectTaxItem(TaxItem item, {bool notify = true}){
    selectedTaxItem = item;
    if(notify) {
      update();
    }
  }

  void getCategoryItemFromId(int? id, {bool notify = true}) {
    final items = taxModel?.data?.data;
    if (items == null || items.isEmpty) return;
    final item = items.firstWhereOrNull((element) => element.id == id);
    if (item != null) {
      setSelectTaxItem(item, notify: notify);
    }
  }


  Future<void> createTax(TaxBody body) async {
    isLoading = true;
    update();
    Response? response = await taxRepository.createTax(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getTax(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editTax(TaxBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await taxRepository.editTax(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getTax(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteTax(int id) async {
    Response? response = await taxRepository.deleteTax(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getTax(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

}
  