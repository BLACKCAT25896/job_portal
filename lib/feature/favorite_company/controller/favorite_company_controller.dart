
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/favorite_company/domain/models/favorite_company_body.dart';
import 'package:mighty_job/feature/favorite_company/domain/models/favorite_company_model.dart';
import 'package:mighty_job/feature/favorite_company/domain/repository/favorite_company_repository.dart';

class FavoriteCompanyController extends GetxController implements GetxService{
  final FavoriteCompanyRepository favoriteCompanyRepository;
  FavoriteCompanyController({required this.favoriteCompanyRepository});



  bool isLoading = false;
  ApiResponse<FavoriteCompanyItem>? favoriteCompanyModel;
  Future<void> getFavoriteCompanyList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await favoriteCompanyRepository.getFavoriteCompanyList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<FavoriteCompanyItem>.fromJson(response?.body, (json)=>
          FavoriteCompanyItem.fromJson(json));
      if(offset == 1){
        favoriteCompanyModel = apiResponse;
      }else{
        favoriteCompanyModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        favoriteCompanyModel?.data?.total = apiResponse.data?.total;
        favoriteCompanyModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  FavoriteCompanyItem? selectedFavoriteCompanyItem;
  void selectFavoriteCompany(FavoriteCompanyItem? item, {bool notify = true}) {
    selectedFavoriteCompanyItem = item;
    if(notify) {
      update();
    }
  }




  Future<void> createNewFavoriteCompany(FavoriteCompanyBody favoriteCompanyBody) async {
    isLoading = true;
    update();
    Response? response = await favoriteCompanyRepository.createNewFavoriteCompany(favoriteCompanyBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getFavoriteCompanyList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateFavoriteCompany(FavoriteCompanyBody favoriteCompanyBody, int id) async {
    isLoading = true;
    update();
    Response? response = await favoriteCompanyRepository.updateFavoriteCompany(favoriteCompanyBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getFavoriteCompanyList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteFavoriteCompany(int id) async {
    isLoading = true;
    Response? response = await favoriteCompanyRepository.deleteFavoriteCompany(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getFavoriteCompanyList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}