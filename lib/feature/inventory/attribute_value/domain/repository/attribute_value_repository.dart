import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class AttributeValueRepository{
  final ApiClient apiClient;
  AttributeValueRepository({required this.apiClient});


  Future<Response?> getAttributeValueList(int page, int attributeId) async {
    return await apiClient.getData("${AppConstants.attributeValue}?page=$page&per_page=10&attribute_id=$attributeId");
  }

  Future<Response?> createNewAttributeValue(int attributeId, String value) async {
    Map<String, dynamic> fields = <String, dynamic>{
      'attribute_id': attributeId,
      'value': value,
    };

    return await apiClient.postData(AppConstants.attributeValue, fields);
  }

  Future<Response?> updateNewAttributeValue(int attributeId, String value, int id) async {
    Map<String, dynamic> fields = <String, dynamic> {
      'attribute_id': attributeId,
      'value': value,
      '_method': 'PUT'
    };
    return await apiClient.postData("${AppConstants.attributeValue}/$id", fields);
  }

  Future<Response?> deleteAttributeValue (int id) async {
    return await apiClient.deleteData("${AppConstants.attributeValue}/$id");
  }
}