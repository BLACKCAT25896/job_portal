import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class SkillRepository{
  final ApiClient apiClient;
  SkillRepository({required this.apiClient});


  Future<Response?> getSkillList(int page, String search) async {
    return await apiClient.getData("${AppConstants.skills}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewSkill(SkillBody body) async {
    return await apiClient.postData(AppConstants.skills, body.toJson());
  }

  Future<Response?> updateSkill(SkillBody body, int id) async {
    return await apiClient.postData("${AppConstants.skills}/$id",
        body.toJson());
  }


  Future<Response?> deleteSkill (int id) async {
    return await apiClient.deleteData("${AppConstants.skills}/$id");
  }
}