import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/recruitment/domain/models/recruitment_body.dart';
import 'package:ecommerce/feature/human_resource/recruitment/domain/models/recruitment_model.dart';
import 'package:ecommerce/feature/human_resource/recruitment/domain/repository/recruitment_repository.dart';

class RecruitmentController extends GetxController implements GetxService{
  final RecruitmentRepository recruitmentRepository;
  RecruitmentController({required this.recruitmentRepository});




  bool isLoading = false;
  ApiResponse<RecruitmentItem>? recruitmentModel;
  Future<void> getRecruitmentList(int offset) async {
    Response? response = await recruitmentRepository.getRecruitmentList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<RecruitmentItem>.fromJson(response?.body, (json)=> RecruitmentItem.fromJson(json));
      if(offset == 1){
        recruitmentModel = apiResponse;
      }else{
        recruitmentModel?.data?.data?.addAll(apiResponse.data!.data!);
        recruitmentModel?.data?.currentPage = apiResponse.data?.currentPage;
        recruitmentModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewRecruitment( RecruitmentBody body,) async {
    isLoading = true;
    update();
    Response? response = await recruitmentRepository.createNewRecruitment(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getRecruitmentList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateRecruitment(RecruitmentBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await recruitmentRepository.updateRecruitment(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getRecruitmentList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteRecruitment(int id) async {
    isLoading = true;
    Response? response = await recruitmentRepository.deleteRecruitment(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getRecruitmentList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  RecruitmentItem? selectedRecruitmentItem;
  void selectRecruitment(RecruitmentItem item, {bool notify = true}){
    selectedRecruitmentItem = item;
    if(notify){
      update();
    }
  }
  List<String> jobTypes = ["full_time", "part_time"];
  String selectedJobType = "full_time";
  void selectJobType(String val , {bool notify = true}) {
    selectedJobType = val;
    if(notify){
      update();
    }
  }

  
}