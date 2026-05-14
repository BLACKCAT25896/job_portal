import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_body.dart';
import 'package:job/util/app_constants.dart';

class CandidateReferenceRepository{
  final ApiClient apiClient;
  CandidateReferenceRepository({required this.apiClient});


  Future<Response?> getCandidateReferenceList(int page) async {
    return await apiClient.getData("${AppConstants.candidateReference}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateReference( CandidateReferenceBody body,) async {
    return await apiClient.postData(AppConstants.candidateReference, body.toJson());
  }

  Future<Response?> updateCandidateReference(CandidateReferenceBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateReference}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateReference (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateReference}/$id");
  }
}