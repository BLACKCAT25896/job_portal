
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_body.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';
import 'package:mighty_job/feature/skill/domain/repository/skill_repository.dart';

class SkillController extends GetxController implements GetxService{
  final SkillRepository skillRepository;
  SkillController({required this.skillRepository});



  bool isLoading = false;
  ApiResponse<SkillItem>? skillModel;
  Future<void> getSkillList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await skillRepository.getSkillList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SkillItem>.fromJson(response?.body, (json)=>
          SkillItem.fromJson(json));
      if(offset == 1){
        skillModel = apiResponse;
      }else{
        skillModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        skillModel?.data?.total = apiResponse.data?.total;
        skillModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  SkillItem? selectedSkillItem;
  void selectSkill(SkillItem? item, {bool notify = true}) {
    selectedSkillItem = item;
    if(notify) {
      update();
    }
  }





  Future<void> createNewSkill(SkillBody skillBody) async {
    isLoading = true;
    update();
    Response? response = await skillRepository.createNewSkill(skillBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSkillList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateSkill(SkillBody skillBody, int id) async {
    isLoading = true;
    update();
    Response? response = await skillRepository.updateSkill(skillBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSkillList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteSkill(int id) async {
    isLoading = true;
    Response? response = await skillRepository.deleteSkill(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSkillList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}