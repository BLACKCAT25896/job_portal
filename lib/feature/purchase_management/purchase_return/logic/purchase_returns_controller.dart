import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/model/popup_menu_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/model/returns_body.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/model/returns_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/repository/purchase_returns_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class PurchaseReturnController extends GetxController implements GetxService {
  final PurchaseReturnRepository purchaseReturnRepository;
  PurchaseReturnController({required this.purchaseReturnRepository});


  bool isLoading = false;
  ApiResponse<PurchaseReturnItem>? purchaseReturnModel;
  Future<void> getPurchaseReturn(int page) async {
    Response? response = await purchaseReturnRepository.getPurchaseReturn(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PurchaseReturnItem>.fromJson(response?.body, (json)=> PurchaseReturnItem.fromJson(json));
      if(page == 1){
        purchaseReturnModel = apiResponse;
      }else{
        purchaseReturnModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        purchaseReturnModel?.data?.total = apiResponse.data?.total;
        purchaseReturnModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  PurchaseReturnItem? selectedPurchaseReturnItem;
  void setSelectPurchaseReturnItem(PurchaseReturnItem item, {bool notify = true}){
    selectedPurchaseReturnItem = item;
    if(notify) {
      update();
    }
  }

  Future<void> createPurchaseReturn(PurchaseReturnBody body) async {
    isLoading = true;
    update();
    Response? response = await purchaseReturnRepository.createPurchaseReturn(body, thumbnail);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getPurchaseReturn(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editPurchaseReturn(PurchaseReturnBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await purchaseReturnRepository.editPurchaseReturn(body, thumbnail, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPurchaseReturn(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deletePurchaseReturn(int id) async {
    Response? response = await purchaseReturnRepository.deletePurchaseReturn(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getPurchaseReturn(1);
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
    Response? response = await purchaseReturnRepository.changeStatus(id, status);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getPurchaseReturn(1);
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
  