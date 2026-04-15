import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/human_resource/award/domain/models/award_body.dart';
import 'package:mighty_job/feature/human_resource/award/domain/models/award_model.dart';
import 'package:mighty_job/feature/human_resource/award/domain/repository/award_repository.dart';

class AwardController extends GetxController implements GetxService{
  final AwardRepository awardRepository;
  AwardController({required this.awardRepository});




  bool isLoading = false;
  ApiResponse<AwardItem>? awardModel;
  Future<void> getAwardList(int offset) async {
    Response? response = await awardRepository.getAwardList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<AwardItem>.fromJson(response?.body, (json)=> AwardItem.fromJson(json));
      if(offset == 1){
        awardModel = apiResponse;
      }else{
        awardModel?.data?.data?.addAll(apiResponse.data!.data!);
        awardModel?.data?.currentPage = apiResponse.data?.currentPage;
        awardModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewAward( AwardBody body,) async {
    isLoading = true;
    update();
    Response? response = await awardRepository.createNewAward(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getAwardList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateAward(AwardBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await awardRepository.updateAward(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getAwardList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteAward(int id) async {
    isLoading = true;
    Response? response = await awardRepository.deleteAward(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getAwardList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  AwardItem? selectedAwardItem;
  void selectAward(AwardItem item){
    selectedAwardItem = item;
    update();
  }
  
}