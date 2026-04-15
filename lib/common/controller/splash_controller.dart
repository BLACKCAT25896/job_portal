
import 'dart:developer';

import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/common/repository/splash_repository.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';

class SplashController extends GetxController implements GetxService{
  final SplashRepository splashRepo;
  SplashController({required this.splashRepo});
  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<void> getConfigData() async {
    Response response = await splashRepo.getConfigData();
    if(response.hasError) {
      ApiChecker.checkApi(response);
    }else {
      showCustomSnackBar("${response.body}'");
    }
  }

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }



  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  bool updateAvailable = false;

  Future<void> checkForUpdate() async {
    log('checking for Update');
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        log('update available');
        updateApp();
        updateAvailable = true;
      }else{
        log('No update available');
        updateAvailable = false;
      }
     update();
    }).catchError((e) {
      log(e.toString());
    });
  }



  void updateApp() async {
    log('Updating');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) {
      log(e.toString());
    });
  }


}
