import 'package:mighty_job/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class PaymentMethodRepository {
  final ApiClient apiClient;

  PaymentMethodRepository({required this.apiClient});
  
  Future<Response?> getPaymentMethod(int page) async {
    return await apiClient.getData("${AppConstants.paymentMethods}?page=$page");
  }



  Future<Response?> editPaymentMethod(PaymentMethodItem body) async {

    return await apiClient.postData("${AppConstants.paymentMethods}/${body.id}", body.toJson());
  }

  Future<Response?> deletePaymentMethod(int id) async {
    return await apiClient.deleteData("${AppConstants.paymentMethods}/$id");
  }

}
  