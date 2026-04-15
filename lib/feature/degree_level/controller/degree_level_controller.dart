
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/degree_level/domain/models/degree_level_body.dart';
import 'package:ecommerce/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:ecommerce/feature/degree_level/domain/repository/degree_level_repository.dart';
import 'package:get/get.dart';

class DegreeLevelController extends GetxController implements GetxService{
  final DegreeLevelRepository degreeLevelRepository;
  DegreeLevelController({required this.degreeLevelRepository});



  bool isLoading = false;
  ApiResponse<DegreeLevelItem>? degreeLevelModel;
  Future<void> getDegreeLevelList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await degreeLevelRepository.getDegreeLevelList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<DegreeLevelItem>.fromJson(response?.body, (json)=>
          DegreeLevelItem.fromJson(json));
      if(offset == 1){
        degreeLevelModel = apiResponse;
      }else{
        degreeLevelModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        degreeLevelModel?.data?.total = apiResponse.data?.total;
        degreeLevelModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  DegreeLevelItem? selectedDegreeLevelItem;
  void selectDegreeLevel(DegreeLevelItem? item, {bool notify = true}) {
    selectedDegreeLevelItem = item;
    if(notify) {
      update();
    }
  }





  Future<void> createNewDegreeLevel(DegreeLevelBody degreeLevelBody) async {
    isLoading = true;
    update();
    Response? response = await degreeLevelRepository.createNewDegreeLevel(degreeLevelBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getDegreeLevelList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateDegreeLevel(DegreeLevelBody degreeLevelBody, int id) async {
    isLoading = true;
    update();
    Response? response = await degreeLevelRepository.updateDegreeLevel(degreeLevelBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getDegreeLevelList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteDegreeLevel(int id) async {
    isLoading = true;
    Response? response = await degreeLevelRepository.deleteDegreeLevel(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getDegreeLevelList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}