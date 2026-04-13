import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class CustomerRepository {
  final ApiClient apiClient;

  CustomerRepository({required this.apiClient});
  
  Future<Response?> getCustomer(int page, {String search = ""}) async {
    return await apiClient.getData("${AppConstants.customers}?page=$page&search=$search");
  }

  Future<Response?> createCustomer(CustomerBody body, XFile? image) async {

    return await apiClient.postData(AppConstants.customers,body.toJson());
  }

  Future<Response?> editCustomer(CustomerBody body, XFile? image, int id) async {

    return await apiClient.postData("${AppConstants.customers}/$id",body.toJson());
  }

  Future<Response?> deleteCustomer(int id) async {
    return await apiClient.deleteData("${AppConstants.customers}/$id");
  }

}
  