import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/models/salary_generate_body.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/models/salary_generate_model.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/repository/salary_generate_repository.dart';

class SalaryGenerateController extends GetxController implements GetxService{
  final SalaryGenerateRepository salaryGenerateRepository;
  SalaryGenerateController({required this.salaryGenerateRepository});




  bool isLoading = false;
  ApiResponse<SalaryGenerateItem>? salaryGenerateModel;
  Future<void> getSalaryGenerateList(int offset) async {
    Response? response = await salaryGenerateRepository.getSalaryGenerateList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SalaryGenerateItem>.fromJson(response?.body, (json)=> SalaryGenerateItem.fromJson(json));
      if(offset == 1){
        salaryGenerateModel = apiResponse;
      }else{
        salaryGenerateModel?.data?.data?.addAll(apiResponse.data!.data!);
        salaryGenerateModel?.data?.currentPage = apiResponse.data?.currentPage;
        salaryGenerateModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewSalaryGenerate(SalaryGenerateBody body,) async {
    isLoading = true;
    update();
    Response? response = await salaryGenerateRepository.createNewSalaryGenerate(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSalaryGenerateList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateSalaryGenerate(SalaryGenerateBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await salaryGenerateRepository.updateSalaryGenerate(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSalaryGenerateList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteSalaryGenerate(int id) async {
    isLoading = true;
    Response? response = await salaryGenerateRepository.deleteSalaryGenerate(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSalaryGenerateList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  SalaryGenerateItem? selectedSalaryGenerateItem;
  void selectSalaryGenerate(SalaryGenerateItem item){
    selectedSalaryGenerateItem = item;
    update();
  }
  
}