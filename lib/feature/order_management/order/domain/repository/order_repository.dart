import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class OrderRepository {
  final ApiClient apiClient;

  OrderRepository({required this.apiClient});

  Future<Response?> getOrder(int page, {int? orderStatusId, int? orderTypeId, String? search}) async {
    try {
      final queryParameters = <String, String>{
        'page': page.toString(),
        'perPage': '10',
        if (orderStatusId != null) 'order_status_id': orderStatusId.toString(),
        if (orderTypeId != null) 'order_type_id': orderTypeId.toString(),
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final queryString = Uri(queryParameters: queryParameters).query;
      final url = "${AppConstants.orders}?$queryString";
      final response = await apiClient.getData(url);
      return response;
    } catch (e) {
      log("Error fetching orders: $e");
      return null;
    }
  }

  Future<Response?> createOrder(OrderBody body) async {
    return await apiClient.postData(AppConstants.orders,body.toJson());
  }

  Future<Response?> editOrder(OrderBody body, int id) async {

    return await apiClient.postData("${AppConstants.orders}/$id",body.toJson());
  }

  Future<Response?> deleteOrder(int id) async {
    return await apiClient.deleteData("${AppConstants.orders}/$id");
  }
  Future<Response?> changeStatus(int id, int status) async {
    return await apiClient.postData("${AppConstants.orders}/change-status", {"id":id, "status":status});
  }
}
  