import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/ownership_type/domain/models/ownership_type_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class OwnershipTypeRepository{
  final ApiClient apiClient;
  OwnershipTypeRepository({required this.apiClient});


  Future<Response?> getOwnershipTypeList(int page, String search) async {
    return await apiClient.getData("${AppConstants.ownerShipTypes}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewOwnershipType(OwnershipTypeBody body) async {
    return await apiClient.postData(AppConstants.ownerShipTypes, body.toJson());
  }

  Future<Response?> updateOwnershipType(OwnershipTypeBody body, int id) async {
    return await apiClient.postData("${AppConstants.ownerShipTypes}/$id",
        body.toJson());
  }


  Future<Response?> deleteOwnershipType (int id) async {
    return await apiClient.deleteData("${AppConstants.ownerShipTypes}/$id");
  }
}