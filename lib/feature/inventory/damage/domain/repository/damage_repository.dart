import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/inventory/damage/domain/models/damage_body.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';

class DamageRepository{
  final ApiClient apiClient;
  DamageRepository({required this.apiClient});


  Future<Response?> getDamageList(int page) async {
    return await apiClient.getData("${AppConstants.damage}?page=$page&per_page=10");
  }

  Future<Response?> createDamage(DamageBody damageBody, XFile? file) async {
    return await apiClient.postMultipartData(AppConstants.damage, damageBody.toJson(), [], MultipartBody("image", file), []);
  }

  Future<Response?> updateDamage(DamageBody damageBody, int id) async {
    return await apiClient.putData("${AppConstants.damage}/$id", damageBody.toJson());
  }

  Future<Response?> damageDetails(int id) async {
    return await apiClient.getData("${AppConstants.damage}/$id");
  }

  Future<Response?> deleteDamage(int id) async {
    return await apiClient.deleteData("${AppConstants.damage}/$id");
  }

}