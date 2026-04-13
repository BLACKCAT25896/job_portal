import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/department/domain/models/department_model.dart';
import 'package:ecommerce/feature/human_resource/department/domain/repository/department_repository.dart';

class DepartmentController extends GetxController implements GetxService{
  final DepartmentRepository departmentRepository;
  DepartmentController({required this.departmentRepository});




  bool isLoading = false;
  ApiResponse<DepartmentItem>? departmentModel;
  Future<void> getDepartmentList(int offset) async {
    Response? response = await departmentRepository.getDepartmentList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<DepartmentItem>.fromJson(response?.body, (json)=> DepartmentItem.fromJson(json));
      if(offset == 1){
        departmentModel = apiResponse;
      }else{
        departmentModel?.data?.data?.addAll(apiResponse.data!.data!);
        departmentModel?.data?.currentPage = apiResponse.data?.currentPage;
        departmentModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewDepartment( String name,) async {
    isLoading = true;
    update();
    Response? response = await departmentRepository.createNewDepartment(name );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getDepartmentList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateDepartment( String name, int id) async {
    isLoading = true;
    update();
    Response? response = await departmentRepository.updateDepartment(name, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getDepartmentList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteDepartment(int id) async {
    isLoading = true;
    Response? response = await departmentRepository.deleteDepartment(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getDepartmentList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  DepartmentItem? selectedDepartmentItem;
  void selectDepartment(DepartmentItem item, {bool notify = true}){
    selectedDepartmentItem = item;
    if(notify) {
      update();
    }
  }
  
}