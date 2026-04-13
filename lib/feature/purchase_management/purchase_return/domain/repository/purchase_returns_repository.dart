import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/model/returns_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class PurchaseReturnRepository {
  final ApiClient apiClient;

  PurchaseReturnRepository({required this.apiClient});
  
  Future<Response?> getPurchaseReturn(int page) async {
    return await apiClient.getData("${AppConstants.purchaseReturn}?page=$page&perPage=10");
  }

  Future<Response?> createPurchaseReturn(PurchaseReturnBody body, XFile? image) async {

    return await apiClient.postMultipartData(AppConstants.purchaseReturn,body.toJson(),[
    ],MultipartBody("image", image), [] );
  }

  Future<Response?> editPurchaseReturn(PurchaseReturnBody body, XFile? image, int id) async {

    return await apiClient.postMultipartData("${AppConstants.purchaseReturn}/$id",body.toJson(),
        [],MultipartBody("image", image), []);
  }

  Future<Response?> deletePurchaseReturn(int id) async {
    return await apiClient.deleteData("${AppConstants.purchaseReturn}/$id");
  }
  Future<Response?> changeStatus(int id, int status) async {
    return await apiClient.postData("${AppConstants.purchaseReturn}/change-status", {"id":id, "status":status});
  }
}
  