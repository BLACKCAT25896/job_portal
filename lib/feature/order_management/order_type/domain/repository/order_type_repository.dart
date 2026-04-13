import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class OrderTypeRepository {
  final ApiClient apiClient;

  OrderTypeRepository({required this.apiClient});
  
  Future<Response?> getOrderType(int page) async {
    return await apiClient.getData("${AppConstants.orderType}?page=$page");
  }

  Future<Response?> createOrderType(String name, ) async {

    return await apiClient.postData(AppConstants.orderType,{
      "name": name
    });
  }

  Future<Response?> editOrderType(String name, int id) async {

    return await apiClient.postData("${AppConstants.orderType}/$id",
    {
      "name": name,
      "_method":"put"
    });
  }

  Future<Response?> deleteOrderType(int id) async {
    return await apiClient.deleteData("${AppConstants.orderType}/$id");
  }

}
  