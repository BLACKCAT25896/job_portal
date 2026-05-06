import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/package_plan/domain/models/package_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class PackageRepository{
  final ApiClient apiClient;
  PackageRepository({required this.apiClient});


  Future<Response?> getPackageList(int page) async {
    return await apiClient.getData("${AppConstants.packages}?page=$page&perPage=10");
  }

  Future<Response?> createNewPackage( PackageBody body) async {
    return await apiClient.postData(AppConstants.packages, body.toJson());
  }

  Future<Response?> updatePackage( PackageBody body, int id) async {
    return await apiClient.putData("${AppConstants.packages}/$id", body.toJson());
  }
  

  Future<Response?> deletePackage (int id) async {
    return await apiClient.deleteData("${AppConstants.packages}/$id");
  }
}