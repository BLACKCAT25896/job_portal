
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_body.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_model.dart';
import 'package:mighty_job/feature/salary_period/domain/repository/salary_period_repository.dart';

class SalaryPeriodController extends GetxController implements GetxService{
  final SalaryPeriodRepository salaryPeriodRepository;
  SalaryPeriodController({required this.salaryPeriodRepository});



  bool isLoading = false;
  ApiResponse<SalaryPeriodItem>? salaryPeriodModel;
  Future<void> getSalaryPeriodList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await salaryPeriodRepository.getSalaryPeriodList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SalaryPeriodItem>.fromJson(response?.body, (json)=>
          SalaryPeriodItem.fromJson(json));
      if(offset == 1){
        salaryPeriodModel = apiResponse;
      }else{
        salaryPeriodModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        salaryPeriodModel?.data?.total = apiResponse.data?.total;
        salaryPeriodModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  SalaryPeriodItem? selectedSalaryPeriodItem;
  void selectSalaryPeriod(SalaryPeriodItem? item, {bool notify = true}) {
    selectedSalaryPeriodItem = item;
    if(notify) {
      update();
    }
  }




  Future<void> createNewSalaryPeriod(SalaryPeriodBody salaryPeriodBody) async {
    isLoading = true;
    update();
    Response? response = await salaryPeriodRepository.createNewSalaryPeriod(salaryPeriodBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSalaryPeriodList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateSalaryPeriod(SalaryPeriodBody salaryPeriodBody, int id) async {
    isLoading = true;
    update();
    Response? response = await salaryPeriodRepository.updateSalaryPeriod(salaryPeriodBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSalaryPeriodList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteSalaryPeriod(int id) async {
    isLoading = true;
    Response? response = await salaryPeriodRepository.deleteSalaryPeriod(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSalaryPeriodList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}