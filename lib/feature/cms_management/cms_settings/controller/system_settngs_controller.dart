
import 'dart:developer';
import 'dart:ui';

import 'package:ecommerce/feature/cms_management/cms_settings/domain/model/default_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/domain/model/cms_section_model.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/domain/model/cms_section_reorder_body.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/domain/model/general_settings_model.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/domain/model/image_setting_model.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/domain/repository/system_settings_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';
import 'package:ecommerce/util/app_constants.dart';

class SystemSettingsController extends GetxController implements GetxService{
  final SystemSettingsRepository systemSettingsRepository;
  SystemSettingsController({required this.systemSettingsRepository});





  Color primaryColor = const Color(0xFF11152B);
  Color secondaryColor = const Color(0xFF11152B);
  Color primaryContainerColor = const Color(0xFF11152B);
  Color textColor = const Color(0xFF11152B);
  Color sidebarColor = const Color(0xFF11152B);
  Color sidebarTextColor = const Color(0xFFFFFFFF);

  bool loading = false;
  GeneralSettingModel? generalSettingModel;
  Future<void> getGeneralSetting() async {
    Response? response = await systemSettingsRepository.getGeneralSetting();
    if (response?.statusCode == 200) {
      generalSettingModel = GeneralSettingModel.fromJson(response?.body);
      if (generalSettingModel != null) {
        primaryColor = AppConstants.parseHexColor((generalSettingModel?.data?.primaryColor ?? "0xFF6750A4"));
        secondaryColor = AppConstants.parseHexColor((generalSettingModel?.data?.secondaryColor ?? "0xFF6750A4"));
        primaryContainerColor = AppConstants.parseHexColor((generalSettingModel?.data?.primaryContainerColor ?? "0xFF6750A4"));
        textColor = AppConstants.parseHexColor((generalSettingModel?.data?.textColor ?? "0xFF6750A4"));
        sidebarColor = AppConstants.parseHexColor((generalSettingModel?.data?.sidebarSelectedBgColor ?? "0xFF6750A4"));
        sidebarTextColor = AppConstants.parseHexColor((generalSettingModel?.data?.sidebarSelectedTextColor ?? "0xFFFFFFFF"));
        }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }


  GeneralSettingModel? generalPublicSettingModel;
  Future<void> getGeneralPublicSetting() async {
    Response? response = await systemSettingsRepository.getGeneralPublicSetting();
    if (response?.statusCode == 200) {
      generalPublicSettingModel = GeneralSettingModel.fromJson(response?.body);
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }



  Future<void>updateGeneralSetting(SettingItem body) async {
    loading = true;
    update();
    Response? response = await systemSettingsRepository.updateGeneralSetting(body);
    if (response?.statusCode == 200) {
      loading = false;
      getGeneralSetting();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    }else{
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> updateSidebarColor(String color) async {
    await _updateColorSetting(systemSettingsRepository.sideBarColorUpdate, color);
  }

  Future<void> updateSidebarTextColor(String color) async {
    await _updateColorSetting(systemSettingsRepository.sideBarTextColorUpdate, color);
  }


  Future<void> updatePrimaryColor(String color) async {
    await _updateColorSetting(systemSettingsRepository.primaryColorUpdate, color);
  }

  Future<void> updateSecondaryColor(String color) async {
    await _updateColorSetting(systemSettingsRepository.secondaryColorUpdate, color);
  }


  Future<void> updatePrimaryContainerColor(String color) async {
    await _updateColorSetting(systemSettingsRepository.primaryContainerColorUpdate, color);
  }

  Future<void> updateTextColor(String color) async {
    await _updateColorSetting(systemSettingsRepository.textColorUpdate, color);
  }




  Future<void> _updateColorSetting(Future<Response?> Function(String) apiCall, String color) async {
    loading = true;
    update();
    Response? response = await apiCall(color);
    loading = false;
    if (response?.statusCode == 200) {
      getGeneralSetting();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }





  Future<void> uploadLogo(XFile? file, String type, int id) async {
    loading = true;
    update();
    Response? response = await systemSettingsRepository.uploadLogo(file, type, id);
    if (response?.statusCode == 200) {
      loading = false;
      getGeneralSetting();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    }else{
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  ImageSettingModel? ecommerceImageSettingModel;
  Future<void> getEcommerceImageSetting() async {
    Response? response = await systemSettingsRepository.getecommerceImageSetting();
    if (response?.statusCode == 200) {
      ecommerceImageSettingModel = ImageSettingModel.fromJson(response?.body);
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }



  int settingsTypeIndex = 0;
  void setSelectedSettingsTypeIndex(int typeIndex){
    settingsTypeIndex = typeIndex;
    update();
  }


  XFile? headerLogo;
  XFile? headerLogoDarkTheme;
  XFile? footerLogo;
  XFile? footerLogoDarkTheme;
  XFile? pickedImage;
  void pickImage({bool darkTheme = false, bool websiteFooter = false, bool footerDarkTheme = false}) async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    log("Here is image size ==> $imageSizeIs");
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      if(darkTheme){
        headerLogoDarkTheme = pickedImage;
      }else if(websiteFooter){
        footerLogo = pickedImage;
      }else if(footerDarkTheme){
        footerLogoDarkTheme = pickedImage;
      }
      else {
        headerLogo = pickedImage;
      }
    }
    update();
  }


  CmsSectionModel? cmsSectionModel;
  Future<void> getCmsSection() async {
    Response? response = await systemSettingsRepository.cmsSection();
    if (response?.statusCode == 200) {
      cmsSectionModel = CmsSectionModel.fromJson(response?.body);
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }




  Future<void> reorderCmsSection(CmsSectionReorderBody body) async {
    loading = true;
    update();
    Response? response = await systemSettingsRepository.cmsSectionReorder(body);
    if (response?.statusCode == 200) {
      loading = false;
      getCmsSection();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    }else{
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  Future<void> whatsappSetting(String whatsappNumber, int chatEnable, int orderEnable ) async {
    loading = true;
    update();
    Response? response = await systemSettingsRepository.whatsappSetting(whatsappNumber, chatEnable, orderEnable);
    if (response?.statusCode == 200) {
      loading = false;
      getGeneralSetting();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    }else{
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> facebookSetting(String pixelCode, int chatEnable, String url ) async {
    loading = true;
    update();
    Response? response = await systemSettingsRepository.facebookSetting(pixelCode, chatEnable, url);
    if (response?.statusCode == 200) {
      loading = false;
      getGeneralSetting();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    }else{
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  bool chatEnable = false;
  void setChatEnable(bool value, {bool notify = true}){
    chatEnable = value;
    if(notify) {
      update();
    }
  }

  bool faceBookChatEnable = false;
  void setFacebookChatEnable(bool value, {bool notify = true}){
    faceBookChatEnable = value;
    if(notify) {
      update();
    }
  }

  bool orderEnable = false;
  void setOrderEnable(bool value, {bool notify = true}) {
    orderEnable = value;
    if(notify) {
      update();
    }
  }



  Future <void> setActiveTheme(int shopId, int themeId) async{
    loading = true;
    update();
    Response? response = await systemSettingsRepository.setTheme(shopId, themeId);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      loading = false;
      getDefaultTheme();
    }else{
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }



  DefaultThemeModel? defaultThemeModel;
  Future<void> getDefaultTheme() async {
    Response? response = await systemSettingsRepository.getDefaultTheme();
    if (response?.statusCode == 200) {
      defaultThemeModel = DefaultThemeModel.fromJson(response?.body);
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }


}