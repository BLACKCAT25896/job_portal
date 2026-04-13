import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_body.dart';

import 'package:ecommerce/util/app_constants.dart';

class SupplierRepository {
  final ApiClient apiClient;

  SupplierRepository({required this.apiClient});
  
  Future<Response?> getSupplier(int page, {String search = ""}) async {
    return await apiClient.getData("${AppConstants.supplier}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createSupplier(SupplierBody body, XFile? image) async {

    return await apiClient.postMultipartData(AppConstants.supplier,body.toJson(),[
    ],MultipartBody("image", image), [] );
  }

  Future<Response?> editSupplier(SupplierBody body, XFile? image, int id) async {

    return await apiClient.postMultipartData("${AppConstants.supplier}/$id",body.toJson(),
        [],MultipartBody("image", image), []);
  }

  Future<Response?> deleteSupplier(int id) async {
    return await apiClient.deleteData("${AppConstants.supplier}/$id");
  }

}
  