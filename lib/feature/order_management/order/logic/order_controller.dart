import 'dart:developer';

import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/pos/presentation/screen/invoice_screen.dart';
import 'package:ecommerce/feature/pos/presentation/widgets/invoice_widget.dart';
import 'package:ecommerce/feature/pos_management/pos/domain/model/invoice_model.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_body.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_model.dart';
import 'package:ecommerce/feature/order_management/order/domain/repository/order_repository.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepository orderRepository;
  OrderController({required this.orderRepository});


  bool isLoading = false;
  OrderModel? orderModel;
  Future<void> getOrder(int page, {int? orderStatusId, int? orderTypeId, String? search}) async {
    Response? response = await orderRepository.getOrder(page, orderStatusId: orderStatusId, orderTypeId: orderTypeId, search: search);
    if (response?.statusCode == 200) {
      final apiResponse = OrderModel.fromJson(response?.body);
      if(page == 1){
        orderModel = apiResponse;
      }else{
        orderModel?.data?.addAll(apiResponse.data??[]);
        orderModel?.meta?.total = apiResponse.meta?.total;
        orderModel?.meta?.currentPage = apiResponse.meta?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  OrderItem? selectedOrderItem;
  void setSelectOrderItem(OrderItem item, {bool notify = true}){
    selectedOrderItem = item;
    if(notify) {
      update();
    }
  }

  int selectedIndex = 0;
  final List<String> filters = ["All", "New", "In Preparation", "Ready"];
  void setSelectedIndex(int index){
    selectedIndex = index;
    update();
  }


  InvoiceModel? invoiceModel;
  Future<void> createOrder(OrderBody body, {bool isSync = false}) async {
    isLoading = true;
    update();
    Response? response = await orderRepository.createOrder(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      invoiceModel = InvoiceModel.fromJson(response?.body);
      log("invoice Response===>${invoiceModel.toString()}");
      isSync? showCustomSnackBar("sync_successfully".tr, isError: false):
      showCustomSnackBar("order_placed".tr, isError: false);
      Get.find<CartController>().clearCart();
      ResponsiveHelper.isDesktop(Get.context!)?
      Get.dialog(CustomDialogWidget(title: "invoice".tr,
          width: 400,
          child: InvoiceWidget())):
      Get.to(()=> InVoiceScreen());
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editOrder(OrderBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await orderRepository.editOrder(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getOrder(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteOrder(int id) async {
    Response? response = await orderRepository.deleteOrder(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getOrder(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  final List<String> orderStatusList = [
    'pending',
    'confirmed',
    'preparing',
    'ready',
    'served',
    'out_for_delivery',
    'completed',
    'cancelled',
    'refunded',
  ];

}
  