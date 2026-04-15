import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/human_resource/designation/domain/models/designation_model.dart';
import 'package:mighty_job/feature/human_resource/designation/domain/repository/designation_repository.dart';

class DesignationController extends GetxController implements GetxService{
  final DesignationRepository designationRepository;
  DesignationController({required this.designationRepository});




  bool isLoading = false;
  ApiResponse<DesignationItem>? designationModel;
  Future<void> getDesignationList(int offset) async {
    Response? response = await designationRepository.getDesignationList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<DesignationItem>.fromJson(response?.body, (json)=> DesignationItem.fromJson(json));
      if(offset == 1){
        designationModel = apiResponse;
      }else{
        designationModel?.data?.data?.addAll(apiResponse.data!.data!);
        designationModel?.data?.currentPage = apiResponse.data?.currentPage;
        designationModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewDesignation( String name,) async {
    isLoading = true;
    update();
    Response? response = await designationRepository.createNewDesignation(name );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getDesignationList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateDesignation( String name, int id) async {
    isLoading = true;
    update();
    Response? response = await designationRepository.updateDesignation(name, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getDesignationList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteDesignation(int id) async {
    isLoading = true;
    Response? response = await designationRepository.deleteDesignation(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getDesignationList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  DesignationItem? selectedDesignationItem;
  void selectDesignation(DesignationItem item, {bool notify = true}){
    selectedDesignationItem = item;
    if(notify) {
      update();
    }
  }
  
}