import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/setting/domain/repository/setting_repository.dart';

class SettingController extends GetxController implements GetxService{
  final SettingRepository settingRepository;
  SettingController({required this.settingRepository});


  bool isLoading = false;
  Future<Response> storageUnLink() async {
    isLoading = true;
    update();
    Response? response = await settingRepository.storageUnLink();
    if(response?.statusCode == 200){
    }
    else{
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
    return response!;
    }

  Future<Response> storageLink() async {
    isLoading = true;
    update();
    Response? response = await settingRepository.storageLink();
    if(response?.statusCode == 200){

    }else{
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
    return response!;
  }

  Future<void> clearCache() async {
    isLoading = true;
    update();
    Response? response = await settingRepository.clearCache();
    if(response?.statusCode == 200){
      showCustomSnackBar("cache_cleared_successfully".tr, isError: false);
    }else{
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
  }

  Future<void> getGeneralSettingInfo() async {
    isLoading = true;
    update();
   // Response? response = await settingRepository.clearCache();
   //  if(response?.statusCode == 200){
   //    showCustomSnackBar("cache_cleared_successfully".tr, isError: false);
   //  }else{
   //    ApiChecker.checkApi(response!);
   //  }
    isLoading = false;
    update();
  }


}