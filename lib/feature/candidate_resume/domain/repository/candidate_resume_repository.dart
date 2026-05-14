import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/candidate_resume/domain/models/candidate_resume_body.dart';
import 'package:job/util/app_constants.dart';

class CandidateResumeRepository{
  final ApiClient apiClient;
  CandidateResumeRepository({required this.apiClient});


  Future<Response?> getCandidateResumeList(int page) async {
    return await apiClient.getData("${AppConstants.candidateResume}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateResume( CandidateResumeBody body, MultipartDocument? multipartDocument) async {
    return await apiClient.postMultipartData(AppConstants.candidateResume, body.toJson(),

    [],null, [], videoFile: multipartDocument);
  }

  Future<Response?> updateCandidateResume(CandidateResumeBody body, int id, MultipartDocument? multipartDocument) async {
    return await apiClient.postMultipartData("${AppConstants.candidateResume}/$id",
        body.toJson(), [], null ,[], videoFile: multipartDocument);
  }
  

  Future<Response?> deleteCandidateResume (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateResume}/$id");
  }
}