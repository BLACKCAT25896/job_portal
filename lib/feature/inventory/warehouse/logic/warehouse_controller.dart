import 'package:mighty_job/feature/inventory/warehouse/domain/model/warehouse_body.dart';
import 'package:mighty_job/feature/inventory/warehouse/domain/model/warehouse_model.dart';
import 'package:mighty_job/feature/inventory/warehouse/domain/repository/warehouse_repository.dart';
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';

class WarehouseController extends GetxController implements GetxService {
  final WarehouseRepository warehouseRepository;
  WarehouseController({required this.warehouseRepository});


  bool isLoading = false;
  ApiResponse<WarehouseItem>? warehouseModel;
  Future<void> getWarehouse(int page) async {
    Response? response = await warehouseRepository.getWarehouse(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<WarehouseItem>.fromJson(response?.body, (json)=> WarehouseItem.fromJson(json));
      if(page == 1){
        warehouseModel = apiResponse;
      }else{
        warehouseModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        warehouseModel?.data?.total = apiResponse.data?.total;
        warehouseModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  WarehouseItem? selectedWarehouseItem;
  void setSelectWarehouseItem(WarehouseItem item, {bool notify = true}){
    selectedWarehouseItem = item;
    if(notify) {
      update();
    }
  }

  void getCategoryItemFromId(int? id, {bool notify = true}) {
    final items = warehouseModel?.data?.data;
    if (items == null || items.isEmpty) return;
    final item = items.firstWhereOrNull((element) => element.id == id);
    if (item != null) {
      setSelectWarehouseItem(item, notify: notify);
    }
  }


  Future<void> createWarehouse(WarehouseBody body) async {
    isLoading = true;
    update();
    Response? response = await warehouseRepository.createWarehouse(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getWarehouse(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editWarehouse(WarehouseBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await warehouseRepository.editWarehouse(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getWarehouse(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteWarehouse(int id) async {
    Response? response = await warehouseRepository.deleteWarehouse(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getWarehouse(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

}
  