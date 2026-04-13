import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';

class BrandRepository{
  final ApiClient apiClient;
  BrandRepository({required this.apiClient});


  Future<Response?> getBrandList(int page, String search) async {
    return await apiClient.getData("${AppConstants.brand}?page=$page&per_page=10&search=$search");
  }

  Future<Response?> createNewBrand( String name, String description, XFile? brandLogo,) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      'description': description,
    };

    return await apiClient.postMultipartData(
        AppConstants.brand,
        fields, [], MultipartBody('logo',brandLogo), [],
    );
  }

  Future<Response?> updateNewBrand( String name, String description, XFile? brandLogo, int id) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      'description': description,
      '_method': 'PUT'
    };

    return await apiClient.updateMultipartData(
      "${AppConstants.brand}/$id",
      fields, [], MultipartBody('logo',brandLogo), [],
    );
  }

  Future<Response?> editBrand({required String email, required String password}) async {
    return await apiClient.postData(AppConstants.brand,
        {"email": email, "password": password});
  }

  Future<Response?> deleteBrand (int id) async {
    return await apiClient.deleteData("${AppConstants.brand}/$id");
  }
}