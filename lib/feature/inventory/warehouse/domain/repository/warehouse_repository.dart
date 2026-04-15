import 'package:mighty_job/feature/inventory/warehouse/domain/model/warehouse_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class WarehouseRepository {
  final ApiClient apiClient;

  WarehouseRepository({required this.apiClient});
  
  Future<Response?> getWarehouse(int page) async {
    return await apiClient.getData("${AppConstants.warehouses}?page=$page");
  }

  Future<Response?> createWarehouse(WarehouseBody body) async {
    return await apiClient.postData(AppConstants.warehouses,body.toJson());
  }

  Future<Response?> editWarehouse(WarehouseBody body, int id) async {

    return await apiClient.postData("${AppConstants.warehouses}/$id",body.toJson());
  }

  Future<Response?> deleteWarehouse(int id) async {
    return await apiClient.deleteData("${AppConstants.warehouses}/$id");
  }

}
  