import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/feature/order_management/order_status/domain/model/order_status_model.dart';
import 'package:ecommerce/feature/order_management/order_status/domain/repository/order_status_repository.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';

class OrderStatusController extends GetxController implements GetxService {
  final OrderStatusRepository orderStatusRepository;
  OrderStatusController({required this.orderStatusRepository});


  bool isLoading = false;
  ApiResponse<OrderStatusItem>? orderStatusModel;
  Future<void> getOrderStatus(int page) async {
    Response? response = await orderStatusRepository.getOrderStatus(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<OrderStatusItem>.fromJson(response?.body, OrderStatusItem.fromJson);

      if(page == 1){
        orderStatusModel = apiResponse;
      }else{
        orderStatusModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        orderStatusModel?.data?.total = apiResponse.data?.total;
        orderStatusModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


  int selectedOrderStatusIndex = 0;
  void setSelectedIndex(int index, {bool notify = true}){
    selectedOrderStatusIndex = index;
    update();
  }



  OrderStatusItem? selectedOrderStatusItem;
  void setSelectOrderStatusItem(OrderStatusItem item, {bool notify = true}){
    selectedOrderStatusItem = item;
    if(notify) {
      update();
    }
  }


  Future<void> createOrderStatus(String name) async {
    isLoading = true;
    update();
    Response? response = await orderStatusRepository.createOrderStatus(name);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getOrderStatus(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editOrderStatus(String name, int id) async {
    isLoading = true;
    update();
    Response? response = await orderStatusRepository.editOrderStatus(name, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getOrderStatus(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteOrderStatus(int id) async {
    Response? response = await orderStatusRepository.deleteOrderStatus(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getOrderStatus(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


}
  