import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class OrderStatusRepository {
  final ApiClient apiClient;

  OrderStatusRepository({required this.apiClient});
  
  Future<Response?> getOrderStatus(int page) async {
    return await apiClient.getData("${AppConstants.orderStatus}?page=$page");
  }

  Future<Response?> createOrderStatus(String name, ) async {

    return await apiClient.postData(AppConstants.orderStatus,{
      "name": name
    });
  }

  Future<Response?> editOrderStatus(String name, int id) async {

    return await apiClient.postData("${AppConstants.orderStatus}/$id",
    {
      "name": name,
      "_method":"put"
    });
  }

  Future<Response?> deleteOrderStatus(int id) async {
    return await apiClient.deleteData("${AppConstants.orderStatus}/$id");
  }

}
  