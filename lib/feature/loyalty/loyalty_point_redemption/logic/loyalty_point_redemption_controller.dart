import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/model/popup_menu_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/model/loyalty_point_redemption_body.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/model/loyalty_point_redemption_model.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/repository/loyalty_point_redemption_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class LoyaltyPointRedemptionController extends GetxController implements GetxService {
  final LoyaltyPointRedemptionRepository loyaltyPointRedemptionRepository;
  LoyaltyPointRedemptionController({required this.loyaltyPointRedemptionRepository});


  bool isLoading = false;
  ApiResponse<LoyaltyPointRedemptionItem>? loyaltyPointRedemptionModel;
  Future<void> getLoyaltyPointRedemption(int page) async {
    Response? response = await loyaltyPointRedemptionRepository.getLoyaltyPointRedemption(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<LoyaltyPointRedemptionItem>.fromJson(response?.body, (json)=> LoyaltyPointRedemptionItem.fromJson(json));
      if(page == 1){
        loyaltyPointRedemptionModel = apiResponse;
      }else{
        loyaltyPointRedemptionModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        loyaltyPointRedemptionModel?.data?.total = apiResponse.data?.total;
        loyaltyPointRedemptionModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  LoyaltyPointRedemptionItem? selectedLoyaltyPointRedemptionItem;
  void setSelectLoyaltyPointRedemptionItem(LoyaltyPointRedemptionItem item, {bool notify = true}){
    selectedLoyaltyPointRedemptionItem = item;
    if(notify) {
      update();
    }
  }

  Future<void> createLoyaltyPointRedemption(LoyaltyPointRedemptionBody body) async {
    isLoading = true;
    update();
    Response? response = await loyaltyPointRedemptionRepository.createLoyaltyPointRedemption(body, thumbnail);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getLoyaltyPointRedemption(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editLoyaltyPointRedemption(LoyaltyPointRedemptionBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await loyaltyPointRedemptionRepository.editLoyaltyPointRedemption(body, thumbnail, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLoyaltyPointRedemption(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteLoyaltyPointRedemption(int id) async {
    Response? response = await loyaltyPointRedemptionRepository.deleteLoyaltyPointRedemption(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getLoyaltyPointRedemption(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  XFile? thumbnail, iconImage;
  XFile? pickedImage;
  void pickImage({bool icon = false}) async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      if(icon){
        iconImage = pickedImage;
      }else {
        thumbnail = pickedImage;
      }
    }
    update();
  }


  Future<void > changeStatus(int id, int status) async {
    Response? response = await loyaltyPointRedemptionRepository.changeStatus(id, status);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLoyaltyPointRedemption(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  bool status = false;
  void setStatus(bool isActive){
    status = isActive;
    update();
  }
  bool offer = false;
  void setOffer(bool isOffer){
    offer = isOffer;
    update();
  }


  List<PopupMenuModel> getPopupMenuList({bool editDelete = false, bool invoice = false}) {
    if(editDelete){
      return [
        PopupMenuModel(title: "edit".tr, icon: Icons.edit),
        PopupMenuModel(title: "delete".tr, icon: Icons.delete_forever),
      ];

    } else if(invoice){
      return [
        PopupMenuModel(title: "view".tr, icon: Icons.remove_red_eye_outlined),
        PopupMenuModel(title: "download_pdf".tr, icon: Icons.download),
        PopupMenuModel(title: "send_remainder".tr, icon: Icons.send),
        PopupMenuModel(title: "edit".tr, icon: Icons.edit),
        PopupMenuModel(title: "delete".tr, icon: Icons.delete_forever),
      ];

    }else {
      return [
        PopupMenuModel(title: "payment".tr, icon: Icons.monetization_on_outlined),
        PopupMenuModel(title: "attendance".tr, icon: Icons.check_circle_outline),
        PopupMenuModel(title: "print_details".tr, icon: Icons.print),
      ];
    }

  }
}
  