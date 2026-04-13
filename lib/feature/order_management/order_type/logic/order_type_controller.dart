import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/feature/order_management/order_type/domain/model/order_type_model.dart';
import 'package:ecommerce/feature/order_management/order_type/domain/repository/order_type_repository.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';

class OrderTypeController extends GetxController implements GetxService {
  final OrderTypeRepository orderTypeRepository;
  OrderTypeController({required this.orderTypeRepository});


  bool isLoading = false;
  ApiResponse<OrderTypeItem>? orderTypeModel;
  Future<void> getOrderType(int page) async {
    Response? response = await orderTypeRepository.getOrderType(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<OrderTypeItem>.fromJson(response?.body, OrderTypeItem.fromJson);

      if(page == 1){
        orderTypeModel = apiResponse;
      }else{
        orderTypeModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        orderTypeModel?.data?.total = apiResponse.data?.total;
        orderTypeModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  OrderTypeItem? selectedOrderTypeItem;
  void setSelectOrderTypeItem(OrderTypeItem item, {bool notify = true}){
    selectedOrderTypeItem = item;
    if(notify) {
      update();
    }
  }


  Future<void> createOrderType(String name) async {
    isLoading = true;
    update();
    Response? response = await orderTypeRepository.createOrderType(name);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getOrderType(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editOrderType(String name, int id) async {
    isLoading = true;
    update();
    Response? response = await orderTypeRepository.editOrderType(name, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getOrderType(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteOrderType(int id) async {
    Response? response = await orderTypeRepository.deleteOrderType(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getOrderType(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


}
  