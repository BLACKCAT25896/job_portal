import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class PurchaseRepository {
  final ApiClient apiClient;

  PurchaseRepository({required this.apiClient});
  
  Future<Response?> getPurchase(int page) async {
    return await apiClient.getData("${AppConstants.purchase}?page=$page");
  }

  Future<Response?> createPurchase(PurchaseBody body) async {

    return await apiClient.postData(AppConstants.purchase,body.toJson());
  }

  Future<Response?> editPurchase(PurchaseBody body, int id) async {

    return await apiClient.postData("${AppConstants.purchase}/$id",body.toJson());
  }

  Future<Response?> deletePurchase(int id) async {
    return await apiClient.deleteData("${AppConstants.purchase}/$id");
  }

}
  