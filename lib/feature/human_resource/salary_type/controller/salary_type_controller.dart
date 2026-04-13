import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/models/salary_type_body.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/models/salary_type_model.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/repository/salary_type_repository.dart';

class SalaryTypeController extends GetxController implements GetxService{
  final SalaryTypeRepository salaryTypeRepository;
  SalaryTypeController({required this.salaryTypeRepository});




  bool isLoading = false;
  ApiResponse<SalaryTypeItem>? salaryTypeModel;
  Future<void> getSalaryTypeList(int offset) async {
    Response? response = await salaryTypeRepository.getSalaryTypeList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SalaryTypeItem>.fromJson(response?.body, (json)=> SalaryTypeItem.fromJson(json));
      if(offset == 1){
        salaryTypeModel = apiResponse;
      }else{
        salaryTypeModel?.data?.data?.addAll(apiResponse.data!.data!);
        salaryTypeModel?.data?.currentPage = apiResponse.data?.currentPage;
        salaryTypeModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewSalaryType(SalaryTypeBody body,) async {
    isLoading = true;
    update();
    Response? response = await salaryTypeRepository.createNewSalaryType(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSalaryTypeList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateSalaryType(SalaryTypeBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await salaryTypeRepository.updateSalaryType(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSalaryTypeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteSalaryType(int id) async {
    isLoading = true;
    Response? response = await salaryTypeRepository.deleteSalaryType(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSalaryTypeList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  SalaryTypeItem? selectedSalaryTypeItem;
  void selectSalaryType(SalaryTypeItem item, {bool notify = true}){
    selectedSalaryTypeItem = item;
    if(notify) {
      update();
    }
  }

  bool isTaxable = false;
  void toggleIsTaxable(bool val, {bool notify = true}){
    isTaxable = val;
    if(notify) {
      update();
    }
  }
  bool isVisibleInPayslip = false;
  void toggleIsVisibleInPayslip(bool val, {bool notify = true}){
    isVisibleInPayslip = val;
    if(notify) {
      update();
    }
  }

  
}