import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_body.dart';
import 'package:job/util/app_constants.dart';

class CandidateLinkRepository{
  final ApiClient apiClient;
  CandidateLinkRepository({required this.apiClient});


  Future<Response?> getCandidateLinkList(int page) async {
    return await apiClient.getData("${AppConstants.candidateSocialLinks}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateLink( CandidateLinkBody body,) async {
    return await apiClient.postData(AppConstants.candidateSocialLinks, body.toJson());
  }

  Future<Response?> updateCandidateLink(CandidateLinkBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateSocialLinks}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateLink (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateSocialLinks}/$id");
  }
}