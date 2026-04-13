import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/tax_management/tax/domain/model/tax_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class TaxRepository {
  final ApiClient apiClient;

  TaxRepository({required this.apiClient});
  
  Future<Response?> getTax(int page) async {
    return await apiClient.getData("${AppConstants.tax}?page=$page");
  }

  Future<Response?> createTax(TaxBody body) async {
    return await apiClient.postData(AppConstants.tax,body.toJson());
  }

  Future<Response?> editTax(TaxBody body, int id) async {

    return await apiClient.postData("${AppConstants.tax}/$id",body.toJson());
  }

  Future<Response?> deleteTax(int id) async {
    return await apiClient.deleteData("${AppConstants.tax}/$id");
  }

}
  