import 'dart:developer';

import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_body.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_model.dart';
import 'package:ecommerce/feature/inventory/category/domain/repository/category_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CategoryController extends GetxController implements GetxService{
  final CategoryRepository categoryRepository;
  CategoryController({required this.categoryRepository});



  XFile? thumbnail;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    log("Here is image size ==> $imageSizeIs");
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      thumbnail = pickedImage;
    }
    update();
  }


  bool isLoading = false;
  ApiResponse<CategoryItem>? categoryModel;
  Future<void> getCategoryList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await categoryRepository.getCategoryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CategoryItem>.fromJson(response?.body, (json)=>
          CategoryItem.fromJson(json));
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


  CategoryItem? selectedCategoryItem;
  void selectCategory(CategoryItem? item, {bool notify = true}) {
    selectedCategoryItem = item;
    if(notify) {
      update();
    }
  }


  bool isFeatured = false;
  bool isHot = false;
  bool isOffer = false;

  void toggleIsFeatured({bool notify = true}){
    isFeatured = !isFeatured;
    if(notify) {
      update();
    }
  }
  void toggleIsHot({bool notify = true}){
    isHot = !isHot;
    if(notify) {
      update();
    }
  }

  void toggleIsOffer({bool notify = true}){
    isOffer = !isOffer;
    if(notify) {
      update();
    }

  }




  Future<void> createNewCategory(CategoryBody categoryBody) async {
    isLoading = true;
    update();
    Response? response = await categoryRepository.createNewCategory(categoryBody, thumbnail);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCategoryList(1);
      thumbnail = null;
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCategory(CategoryBody categoryBody, int id) async {
    isLoading = true;
    update();
    Response? response = await categoryRepository.updateCategory(categoryBody, thumbnail, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.toNamed(RouteHelper.getCategoryRoute());
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCategoryList(1);
      thumbnail = null;
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCategory(int id) async {
    isLoading = true;
    Response? response = await categoryRepository.deleteCategory(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCategoryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}