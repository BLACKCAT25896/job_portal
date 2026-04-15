
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/career_level/domain/models/career_level_body.dart';
import 'package:ecommerce/feature/career_level/domain/models/career_level_model.dart';
import 'package:ecommerce/feature/career_level/domain/repository/career_level_repository.dart';
import 'package:get/get.dart';

class CareerLevelController extends GetxController implements GetxService{
  final CareerLevelRepository careerLevelRepository;
  CareerLevelController({required this.careerLevelRepository});



  bool isLoading = false;
  ApiResponse<CareerLevelItem>? careerLevelModel;
  Future<void> getCareerLevelList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await careerLevelRepository.getCareerLevelList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CareerLevelItem>.fromJson(response?.body, (json)=>
          CareerLevelItem.fromJson(json));
      if(offset == 1){
        careerLevelModel = apiResponse;
      }else{
        careerLevelModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        careerLevelModel?.data?.total = apiResponse.data?.total;
        careerLevelModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  CareerLevelItem? selectedCareerLevelItem;
  void selectCareerLevel(CareerLevelItem? item, {bool notify = true}) {
    selectedCareerLevelItem = item;
    if(notify) {
      update();
    }
  }





  Future<void> createNewCareerLevel(CareerLevelBody careerLevelBody) async {
    isLoading = true;
    update();
    Response? response = await careerLevelRepository.createNewCareerLevel(careerLevelBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCareerLevelList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCareerLevel(CareerLevelBody careerLevelBody, int id) async {
    isLoading = true;
    update();
    Response? response = await careerLevelRepository.updateCareerLevel(careerLevelBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCareerLevelList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCareerLevel(int id) async {
    isLoading = true;
    Response? response = await careerLevelRepository.deleteCareerLevel(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCareerLevelList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}