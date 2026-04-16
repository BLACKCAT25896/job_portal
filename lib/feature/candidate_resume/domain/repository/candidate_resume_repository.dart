import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class CandidateResumeRepository{
  final ApiClient apiClient;
  CandidateResumeRepository({required this.apiClient});


  Future<Response?> getCandidateResumeList(int page) async {
    return await apiClient.getData("${AppConstants.candidateResume}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateResume( CandidateResumeBody body,) async {
    return await apiClient.postData(AppConstants.candidateResume, body.toJson());
  }

  Future<Response?> updateCandidateResume(CandidateResumeBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateResume}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateResume (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateResume}/$id");
  }
}