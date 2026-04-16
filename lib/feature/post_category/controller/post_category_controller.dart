
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_body.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_model.dart';
import 'package:mighty_job/feature/post_category/domain/repository/post_category_repository.dart';

class PostCategoryController extends GetxController implements GetxService{
  final PostCategoryRepository postCategoryRepository;
  PostCategoryController({required this.postCategoryRepository});




  bool isLoading = false;
  ApiResponse<PostCategoryItem>? categoryModel;
  Future<void> getPostCategoryList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await postCategoryRepository.getPostCategoryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PostCategoryItem>.fromJson(response?.body, (json)=>
          PostCategoryItem.fromJson(json));
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


  PostCategoryItem? selectedPostCategoryItem;
  void selectPostCategory(PostCategoryItem? item, {bool notify = true}) {
    selectedPostCategoryItem = item;
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



  Future<void> createNewPostCategory(PostCategoryBody categoryBody) async {
    isLoading = true;
    update();
    Response? response = await postCategoryRepository.createNewPostCategory(categoryBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getPostCategoryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updatePostCategory(PostCategoryBody categoryBody, int id) async {
    isLoading = true;
    update();
    Response? response = await postCategoryRepository.updatePostCategory(categoryBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPostCategoryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deletePostCategory(int id) async {
    isLoading = true;
    Response? response = await postCategoryRepository.deletePostCategory(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getPostCategoryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}