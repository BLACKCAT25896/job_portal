import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class AttributeRepository{
  final ApiClient apiClient;
  AttributeRepository({required this.apiClient});


  Future<Response?> getAttributeList(int page, String search) async {
    return await apiClient.getData("${AppConstants.attribute}?page=$page&per_page=10&search=$search");
  }

  Future<Response?> createNewAttribute( String name) async {
    Map<String, String> fields = <String, String> {
      'name': name,
    };

    return await apiClient.postData(AppConstants.attribute, fields);
  }

  Future<Response?> updateNewAttribute( String name, int id) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      '_method': 'PUT'
    };

    return await apiClient.postData("${AppConstants.attribute}/$id", fields);
  }

  Future<Response?> deleteAttribute (int id) async {
    return await apiClient.deleteData("${AppConstants.attribute}/$id");
  }
}