import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_body.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_model.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/repository/salary_setup_repository.dart';

class SalarySetupController extends GetxController implements GetxService{
  final SalarySetupRepository salarySetupRepository;
  SalarySetupController({required this.salarySetupRepository});




  bool isLoading = false;
  ApiResponse<SalarySetupItem>? salarySetupModel;
  Future<void> getSalarySetupList(int offset) async {
    Response? response = await salarySetupRepository.getSalarySetupList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SalarySetupItem>.fromJson(response?.body, (json)=> SalarySetupItem.fromJson(json));
      if(offset == 1){
        salarySetupModel = apiResponse;
      }else{
        salarySetupModel?.data?.data?.addAll(apiResponse.data!.data!);
        salarySetupModel?.data?.currentPage = apiResponse.data?.currentPage;
        salarySetupModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewSalarySetup(SalarySetupBody body,) async {
    isLoading = true;
    update();
    Response? response = await salarySetupRepository.createNewSalarySetup(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSalarySetupList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateSalarySetup(SalarySetupBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await salarySetupRepository.updateSalarySetup(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSalarySetupList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteSalarySetup(int id) async {
    isLoading = true;
    Response? response = await salarySetupRepository.deleteSalarySetup(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSalarySetupList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  SalarySetupItem? selectedSalarySetupItem;
  void selectSalarySetup(SalarySetupItem item){
    selectedSalarySetupItem = item;
    update();
  }
  
}