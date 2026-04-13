import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:ecommerce/feature/payment_method/domain/repository/payment_method_repository.dart';

class PaymentMethodController extends GetxController implements GetxService {
  final PaymentMethodRepository paymentMethodRepository;
  PaymentMethodController({required this.paymentMethodRepository});


  bool isLoading = false;
  ApiResponse<PaymentMethodItem>? paymentMethod;
  PaymentMethodItem? payStackPaymentGatewayItem;
  PaymentMethodItem? razorPayPaymentGatewayItem;
  PaymentMethodItem? stripePaymentGatewayItem;
  PaymentMethodItem? payPalPaymentGatewayItem;
  PaymentMethodItem? sslCommerzPaymentGatewayItem;
  PaymentMethodItem? paymobAcceptPaymentGatewayItem;
  PaymentMethodItem? flutterWavePaymentGatewayItem;
  PaymentMethodItem? senangPayPaymentGatewayItem;
  PaymentMethodItem? payTmPaymentGatewayItem;
  PaymentMethodItem? bKashPaymentGatewayItem;
  PaymentMethodItem? codPaymentGatewayItem;
  Future<void> getPaymentMethod(int page) async {
    Response? response = await paymentMethodRepository.getPaymentMethod(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PaymentMethodItem>.fromJson(response?.body, (json)=> PaymentMethodItem.fromJson(json));
      if(page == 1){
        paymentMethod = apiResponse;
      }else{
        paymentMethod?.data?.data?.addAll(apiResponse.data?.data??[]);
        paymentMethod?.data?.total = apiResponse.data?.total;
        paymentMethod?.data?.currentPage = apiResponse.data?.currentPage;
      }
      PaymentMethodItem? findGatewaySafe(String name) {
        final list = paymentMethod?.data?.data;
        if (list == null) return null;
        for (var item in list) {
          if (item.type == name) return item;
        }
        return null;
      }

      payStackPaymentGatewayItem = findGatewaySafe("paystack");
      razorPayPaymentGatewayItem = findGatewaySafe("razorpay");
      stripePaymentGatewayItem = findGatewaySafe("stripe");
      payPalPaymentGatewayItem = findGatewaySafe("paypal");
      sslCommerzPaymentGatewayItem = findGatewaySafe("ssl_commerce");
      paymobAcceptPaymentGatewayItem = findGatewaySafe("paymob_accept");
      flutterWavePaymentGatewayItem = findGatewaySafe("flutterwave");
      senangPayPaymentGatewayItem = findGatewaySafe("senang_pay");
      payTmPaymentGatewayItem = findGatewaySafe("paytm");
      bKashPaymentGatewayItem = findGatewaySafe("bkash");
      codPaymentGatewayItem = findGatewaySafe("cash");
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  PaymentMethodItem? selectedPaymentMethodItem;
  void setSelectPaymentMethodItem(PaymentMethodItem item, {bool notify = true}){
    selectedPaymentMethodItem = item;
    if(notify) {
      update();
    }
  }


  Future<void> editPaymentMethod(PaymentMethodItem body) async {
    isLoading = true;
    update();
    Response? response = await paymentMethodRepository.editPaymentMethod(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPaymentMethod(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deletePaymentMethod(int id) async {
    Response? response = await paymentMethodRepository.deletePaymentMethod(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getPaymentMethod(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  List<String> paymentTypes = ["paid", "unpaid", "partial"];
  String? selectedPaymentType;
  void setSelectPaymentType(String type){
    selectedPaymentType = type;
    update();
  }

  Future<void> paymentGatewayStatusUpdate(int id) async {
    updateStatus(value: false, id: id.toString(),
        type: "payment ", onSuccess: () async {
          getPaymentMethod(1);
        });
    update();
  }


}
  