import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/model/loyalty_point_redemption_body.dart';

import 'package:ecommerce/util/app_constants.dart';

class LoyaltyPointRedemptionRepository {
  final ApiClient apiClient;

  LoyaltyPointRedemptionRepository({required this.apiClient});
  
  Future<Response?> getLoyaltyPointRedemption(int page) async {
    return await apiClient.getData("${AppConstants.loyaltyPointRedemption}?page=$page&perPage=10");
  }

  Future<Response?> createLoyaltyPointRedemption(LoyaltyPointRedemptionBody body, XFile? image) async {

    return await apiClient.postMultipartData(AppConstants.loyaltyPointRedemption,body.toJson(),[
    ],MultipartBody("image", image), [] );
  }

  Future<Response?> editLoyaltyPointRedemption(LoyaltyPointRedemptionBody body, XFile? image, int id) async {

    return await apiClient.postMultipartData("${AppConstants.loyaltyPointRedemption}/$id",body.toJson(),
        [],MultipartBody("image", image), []);
  }

  Future<Response?> deleteLoyaltyPointRedemption(int id) async {
    return await apiClient.deleteData("${AppConstants.loyaltyPointRedemption}/$id");
  }
  Future<Response?> changeStatus(int id, int status) async {
    return await apiClient.postData("${AppConstants.loyaltyPointRedemption}/change-status", {"id":id, "status":status});
  }
}
  