import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_body.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CategoryRepository{
  final ApiClient apiClient;
  CategoryRepository({required this.apiClient});


  Future<Response?> getCategoryList(int page, String search) async {
    return await apiClient.getData("${AppConstants.categories}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewCategory(CategoryBody categoryBody, XFile? icon) async {
    return await apiClient.postMultipartData(AppConstants.categories, categoryBody.toJson(),
      [], MultipartBody("image", icon), []
    );
  }

  Future<Response?> updateCategory(CategoryBody categoryBody,XFile? icon, int id) async {
    return await apiClient.postMultipartData("${AppConstants.categories}/$id",
        categoryBody.toJson(), [], MultipartBody("image", icon), []);
  }


  Future<Response?> deleteCategory (int id) async {
    return await apiClient.deleteData("${AppConstants.categories}/$id");
  }
}