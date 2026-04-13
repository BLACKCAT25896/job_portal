import 'package:ecommerce/feature/inventory/unit_measurement/domain/model/unit_body.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/domain/model/unit_model.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/domain/repository/unit_repository.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';

class UnitController extends GetxController implements GetxService {
  final UnitRepository unitRepository;
  UnitController({required this.unitRepository});


  bool isLoading = false;
  ApiResponse<UnitItem>? unitModel;
  Future<void> getUnit(int page) async {
    Response? response = await unitRepository.getUnit(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<UnitItem>.fromJson(response?.body, (json)=> UnitItem.fromJson(json));
      if(page == 1){
        unitModel = apiResponse;
      }else{
        unitModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        unitModel?.data?.total = apiResponse.data?.total;
        unitModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  UnitItem? selectedUnitItem;
  void setSelectUnitItem(UnitItem item, {bool notify = true}){
    selectedUnitItem = item;
    if(notify) {
      update();
    }
  }



  Future<void> createUnit(UnitBody body) async {
    isLoading = true;
    update();
    Response? response = await unitRepository.createUnit(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getUnit(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editUnit(UnitBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await unitRepository.editUnit(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getUnit(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteUnit(int id) async {
    Response? response = await unitRepository.deleteUnit(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getUnit(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

}
  