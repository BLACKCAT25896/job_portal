
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_body.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/feature/job_category/domain/repository/job_category_repository.dart';
import 'package:get/get.dart';

class JobCategoryController extends GetxController implements GetxService{
  final JobCategoryRepository categoryRepository;
  JobCategoryController({required this.categoryRepository});




  bool isLoading = false;
  ApiResponse<JobCategoryItem>? categoryModel;
  Future<void> getJobCategoryList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await categoryRepository.getJobCategoryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<JobCategoryItem>.fromJson(response?.body, (json)=>
          JobCategoryItem.fromJson(json));
      if(offset == 1){
        categoryModel = apiResponse;
      }else{
        categoryModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        categoryModel?.data?.total = apiResponse.data?.total;
        categoryModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  JobCategoryItem? selectedJobCategoryItem;
  void selectJobCategory(JobCategoryItem? item, {bool notify = true}) {
    selectedJobCategoryItem = item;
    if(notify) {
      update();
    }
  }


  bool isFeatured = false;
  bool isDefault = false;

  void toggleIsFeatured({bool notify = true}){
    isFeatured = !isFeatured;
    if(notify) {
      update();
    }
  }
  void toggleIsisDefault({bool notify = true}){
    isDefault = !isDefault;
    if(notify) {
      update();
    }
  }



  Future<void> createNewJobCategory(JobCategoryBody categoryBody) async {
    isLoading = true;
    update();
    Response? response = await categoryRepository.createNewJobCategory(categoryBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getJobCategoryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateJobCategory(JobCategoryBody categoryBody, int id) async {
    isLoading = true;
    update();
    Response? response = await categoryRepository.updateJobCategory(categoryBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getJobCategoryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteJobCategory(int id) async {
    isLoading = true;
    Response? response = await categoryRepository.deleteJobCategory(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getJobCategoryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}