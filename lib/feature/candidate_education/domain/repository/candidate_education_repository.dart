import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class CandidateEducationRepository{
  final ApiClient apiClient;
  CandidateEducationRepository({required this.apiClient});


  Future<Response?> getCandidateEducationList(int page) async {
    return await apiClient.getData("${AppConstants.candidateEducation}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateEducation( CandidateEducationBody body,) async {
    return await apiClient.postData(AppConstants.candidateEducation, body.toJson());
  }

  Future<Response?> updateCandidateEducation(CandidateEducationBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateEducation}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateEducation (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateEducation}/$id");
  }
}