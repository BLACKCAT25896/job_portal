import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/model/popup_menu_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/domain/model/loyalty_point_body.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/domain/model/loyalty_point_model.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/domain/repository/loyalty_point_repository.dart';
import 'package:mighty_job/helper/image_size_checker.dart';

class LoyaltyPointController extends GetxController implements GetxService {
  final LoyaltyPointRepository loyaltyPointRepository;
  LoyaltyPointController({required this.loyaltyPointRepository});


  bool isLoading = false;
  ApiResponse<LoyaltyPointItem>? loyaltyPointModel;
  Future<void> getLoyaltyPoint(int page) async {
    Response? response = await loyaltyPointRepository.getLoyaltyPoint(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<LoyaltyPointItem>.fromJson(response?.body, (json)=> LoyaltyPointItem.fromJson(json));
      if(page == 1){
        loyaltyPointModel = apiResponse;
      }else{
        loyaltyPointModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        loyaltyPointModel?.data?.total = apiResponse.data?.total;
        loyaltyPointModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  LoyaltyPointItem? selectedLoyaltyPointItem;
  void setSelectLoyaltyPointItem(LoyaltyPointItem item, {bool notify = true}){
    selectedLoyaltyPointItem = item;
    if(notify) {
      update();
    }
  }

  Future<void> createLoyaltyPoint(LoyaltyPointBody body) async {
    isLoading = true;
    update();
    Response? response = await loyaltyPointRepository.createLoyaltyPoint(body, thumbnail);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getLoyaltyPoint(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editLoyaltyPoint(LoyaltyPointBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await loyaltyPointRepository.editLoyaltyPoint(body, thumbnail, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLoyaltyPoint(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteLoyaltyPoint(int id) async {
    Response? response = await loyaltyPointRepository.deleteLoyaltyPoint(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getLoyaltyPoint(1);
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
    Response? response = await loyaltyPointRepository.changeStatus(id, status);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLoyaltyPoint(1);
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
  