
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/favorite_job/domain/models/favorite_job_body.dart';
import 'package:mighty_job/feature/favorite_job/domain/models/favorite_job_model.dart';
import 'package:mighty_job/feature/favorite_job/domain/repository/favorite_job_repository.dart';
import 'package:get/get.dart';

class FavoriteJobController extends GetxController implements GetxService{
  final FavoriteJobRepository favoriteJobRepository;
  FavoriteJobController({required this.favoriteJobRepository});




  bool isLoading = false;
  ApiResponse<FavoriteJobItem>? favoriteJobModel;
  Future<void> getFavoriteJobList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await favoriteJobRepository.getFavoriteJobList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<FavoriteJobItem>.fromJson(response?.body, (json)=>
          FavoriteJobItem.fromJson(json));
      if(offset == 1){
        favoriteJobModel = apiResponse;
      }else{
        favoriteJobModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        favoriteJobModel?.data?.total = apiResponse.data?.total;
        favoriteJobModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  FavoriteJobItem? selectedFavoriteJobItem;
  void selectFavoriteJob(FavoriteJobItem? item, {bool notify = true}) {
    selectedFavoriteJobItem = item;
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



  Future<void> createNewFavoriteJob(FavoriteJobBody favoriteJobBody) async {
    isLoading = true;
    update();
    Response? response = await favoriteJobRepository.createNewFavoriteJob(favoriteJobBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getFavoriteJobList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateFavoriteJob(FavoriteJobBody favoriteJobBody, int id) async {
    isLoading = true;
    update();
    Response? response = await favoriteJobRepository.updateFavoriteJob(favoriteJobBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getFavoriteJobList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteFavoriteJob(int id) async {
    isLoading = true;
    Response? response = await favoriteJobRepository.deleteFavoriteJob(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getFavoriteJobList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}