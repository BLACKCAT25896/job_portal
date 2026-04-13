import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/human_resource/award/domain/models/award_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class AwardRepository{
  final ApiClient apiClient;
  AwardRepository({required this.apiClient});


  Future<Response?> getAwardList(int page) async {
    return await apiClient.getData("${AppConstants.awards}?page=$page&perPage=10");
  }

  Future<Response?> createNewAward( AwardBody body,) async {
    return await apiClient.postData(AppConstants.awards, body.toJson());
  }

  Future<Response?> updateAward(AwardBody body, int id) async {
    return await apiClient.putData("${AppConstants.awards}/$id", body.toJson());
  }
  

  Future<Response?> deleteAward (int id) async {
    return await apiClient.deleteData("${AppConstants.awards}/$id");
  }
}