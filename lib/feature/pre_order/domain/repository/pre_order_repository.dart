import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class AuctionRepository {
  final ApiClient apiClient;

  AuctionRepository({required this.apiClient});
  
  Future<Response?> getAuction(int page) async {
    return await apiClient.getData("${AppConstants.auction}?page=$page");
  }

  Future<Response?> createAuction(AuctionBody body) async {

    return await apiClient.postData(AppConstants.auction,body.toJson());
  }

  Future<Response?> editAuction(AuctionBody body, int id) async {

    return await apiClient.postData("${AppConstants.auction}/$id",body.toJson());
  }

  Future<Response?> deleteAuction(int id) async {
    return await apiClient.deleteData("${AppConstants.auction}/$id");
  }

}
  