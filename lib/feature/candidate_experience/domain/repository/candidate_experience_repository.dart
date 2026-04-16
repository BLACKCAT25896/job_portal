import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class CandidateExperienceRepository{
  final ApiClient apiClient;
  CandidateExperienceRepository({required this.apiClient});


  Future<Response?> getCandidateExperienceList(int page) async {
    return await apiClient.getData("${AppConstants.candidateExperience}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateExperience( CandidateExperienceBody body,) async {
    return await apiClient.postData(AppConstants.candidateExperience, body.toJson());
  }

  Future<Response?> updateCandidateExperience(CandidateExperienceBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateExperience}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateExperience (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateExperience}/$id");
  }
}