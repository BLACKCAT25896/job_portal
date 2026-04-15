import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/models/candidate_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class CandidateRepository{
  final ApiClient apiClient;
  CandidateRepository({required this.apiClient});


  Future<Response?> getCandidateList(int page) async {
    return await apiClient.getData("${AppConstants.candidates}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidate( CandidateBody body,) async {
    return await apiClient.postData(AppConstants.candidates, body.toJson());
  }

  Future<Response?> updateCandidate(CandidateBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidates}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidate (int id) async {
    return await apiClient.deleteData("${AppConstants.candidates}/$id");
  }
}