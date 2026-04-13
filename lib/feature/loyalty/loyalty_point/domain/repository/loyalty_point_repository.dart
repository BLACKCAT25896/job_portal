import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point/domain/model/loyalty_point_body.dart';

import 'package:ecommerce/util/app_constants.dart';

class LoyaltyPointRepository {
  final ApiClient apiClient;

  LoyaltyPointRepository({required this.apiClient});
  
  Future<Response?> getLoyaltyPoint(int page) async {
    return await apiClient.getData("${AppConstants.loyaltyPoint}?page=$page&perPage=10");
  }

  Future<Response?> createLoyaltyPoint(LoyaltyPointBody body, XFile? image) async {

    return await apiClient.postMultipartData(AppConstants.loyaltyPoint,body.toJson(),[
    ],MultipartBody("image", image), [] );
  }

  Future<Response?> editLoyaltyPoint(LoyaltyPointBody body, XFile? image, int id) async {

    return await apiClient.postMultipartData("${AppConstants.loyaltyPoint}/$id",body.toJson(),
        [],MultipartBody("image", image), []);
  }

  Future<Response?> deleteLoyaltyPoint(int id) async {
    return await apiClient.deleteData("${AppConstants.loyaltyPoint}/$id");
  }
  Future<Response?> changeStatus(int id, int status) async {
    return await apiClient.postData("${AppConstants.loyaltyPoint}/change-status", {"id":id, "status":status});
  }
}
  