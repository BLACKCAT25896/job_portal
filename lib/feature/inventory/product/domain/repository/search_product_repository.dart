import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';


class SearchProductRepository{
  final ApiClient apiClient;

  SearchProductRepository({required this.apiClient});
  Future<Response?> getSearchProductList (String code, String wareHouseId) async {
    return await apiClient.getData("${AppConstants.products}?code=$code&ware_house_id=$wareHouseId");
  }

  Future<Response?> getDefaultSearchProductList () async {
    return await apiClient.getData(AppConstants.products);
  }
}