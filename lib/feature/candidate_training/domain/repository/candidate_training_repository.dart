import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_body.dart';
import 'package:job/util/app_constants.dart';

class CandidateTrainingRepository{
  final ApiClient apiClient;
  CandidateTrainingRepository({required this.apiClient});


  Future<Response?> getCandidateTrainingList(int page) async {
    return await apiClient.getData("${AppConstants.candidateTraining}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateTraining( CandidateTrainingBody body,) async {
    return await apiClient.postData(AppConstants.candidateTraining, body.toJson());
  }

  Future<Response?> updateCandidateTraining(CandidateTrainingBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateTraining}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateTraining (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateTraining}/$id");
  }
}