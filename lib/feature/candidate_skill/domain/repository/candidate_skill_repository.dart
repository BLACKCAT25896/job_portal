import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/skill/domain/models/skill_body.dart';
import 'package:job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CandidateSkillRepository{
  final ApiClient apiClient;
  CandidateSkillRepository({required this.apiClient});


  Future<Response?> getSkillList(int page, String search) async {
    return await apiClient.getData("${AppConstants.candidateSkills}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewSkill(SkillBody body) async {
    return await apiClient.postData(AppConstants.candidateSkills, body.toJson());
  }

  Future<Response?> updateSkill(SkillBody body, int id) async {
    return await apiClient.postData("${AppConstants.candidateSkills}/$id",
        body.toJson());
  }


  Future<Response?> deleteSkill (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateSkills}/$id");
  }
}