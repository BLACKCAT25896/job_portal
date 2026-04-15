import 'package:mighty_job/feature/inventory/unit_measurement/domain/model/unit_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class UnitRepository {
  final ApiClient apiClient;

  UnitRepository({required this.apiClient});
  
  Future<Response?> getUnit(int page) async {
    return await apiClient.getData("${AppConstants.unit}?page=$page");
  }

  Future<Response?> createUnit(UnitBody body) async {
    return await apiClient.postData(AppConstants.unit,body.toJson());
  }

  Future<Response?> editUnit(UnitBody body, int id) async {

    return await apiClient.postData("${AppConstants.unit}/$id",body.toJson());
  }

  Future<Response?> deleteUnit(int id) async {
    return await apiClient.deleteData("${AppConstants.unit}/$id");
  }

}
  