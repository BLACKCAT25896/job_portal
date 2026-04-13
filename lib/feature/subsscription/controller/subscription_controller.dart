import 'dart:developer';

import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/feature/subsscription/domain/models/package_model.dart';
import 'package:ecommerce/feature/subsscription/domain/repository/subscription_repository.dart';
import 'package:ecommerce/feature/subsscription/presentation/widgets/subscription_request_successfull_dialog.dart';

class SubscriptionController extends GetxController implements GetxService{
  final SubscriptionRepository subscriptionRepository;

  SubscriptionController({required this.subscriptionRepository});

  bool isLoading = false;
  PackageModel? packageModel;
  Future<void> getStockList() async {
    isLoading = true;
    Response? response = await subscriptionRepository.getPackageList();
    if (response?.statusCode == 200) {
      packageModel = PackageModel.fromJson(response?.body);
      if(packageModel != null){
        for( int i= 0; i < packageModel!.data!.length; i++){
          log("message===>>> ${packageModel?.data?[i].name}===${Get.find<ProfileController>().profileModel?.data?.subscription?.package?.packageType}");
          if(packageModel?.data?[i].name == Get.find<ProfileController>().profileModel?.data?.subscription?.package?.packageType){
            selectPackage(i);
            break;
          }

        }
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  Future<void> purchasePackage(int packageId, String userPhone, String shopPhone) async {
    isLoading = true;
    update();
    Response? response = await subscriptionRepository.purchasePackage(packageId, userPhone, shopPhone);
    if (response?.statusCode == 200) {
      Get.dialog(const SubscriptionRequestSuccessfulDialog());
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  int selectedPackage = -1;
  int? selectedPackageId;
  String? selectedPackageName;
  void selectPackage(int index) {
    selectedPackage = index;
    selectedPackageId = packageModel?.data?[index].id;
    selectedPackageName = packageModel?.data?[index].name;
    update();
  }
}