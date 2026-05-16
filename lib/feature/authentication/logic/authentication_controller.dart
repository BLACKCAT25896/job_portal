import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/authentication/domain/model/create_candidate_account_body.dart';
import 'package:job/feature/authentication/domain/model/create_company_account_body.dart';
import 'package:job/feature/authentication/domain/model/user_role_permission_model.dart';
import 'package:job/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:job/feature/authentication/presentation/widgets/gender_selection_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/image_size_checker.dart';
import 'package:job/helper/route_helper.dart';

class AuthenticationController extends GetxController implements GetxService{
  final AuthenticationRepository authenticationRepository;
  AuthenticationController({required this.authenticationRepository});



  void updateToken() {
    authenticationRepository.updateToken();
  }



  bool isLoading = false;
  Future<void> login( String email, String password) async {
    isLoading = true;
    update();
    Response? response = await authenticationRepository.login(email: email, password: password);
    log("status code==>${response?.statusCode}");
    if(response!.statusCode == 200){
      isLoading = false;
      setUserToken(response.body['data']['access_token']);
      updateToken();
      String userType = response.body['data']["user"]['user_type'].toString();
      setUserType(userType);
      if(userType == 'Super Admin'){
        await Get.find<ProfileController>().getProfileInfo().then((val){
          Get.offNamed(RouteHelper.getDashboardRoute());
        });
      }else if(userType == "Employer" || userType == "Company"){
        await Get.find<ProfileController>().getCompanyProfileInfo().then((val){
          Get.offNamed(RouteHelper.getCompanyJobListingRoute());
        });
      }else{
        await Get.find<ProfileController>().getCandidateProfileInfo().then((val){
          Get.offNamed(RouteHelper.getInitialRoute());
        });
      }

    }else{
      isLoading = false;
     showCustomSnackBar("${response.body['message']}");
    }
    update();

  }

  String countryDialCode = '+880';
  void setCountryCode( String countryCode){
    countryDialCode  = countryDialCode;
    update();
  }

  bool isAccept = false;
  void setAccept(bool value){
    isAccept = value;
    update();
  }


  Future<void> candidateRegistration(CreateCandidateAccountBody body) async {
    isLoading = true;
    update();
    Response? response = await authenticationRepository.candidateRegistration(body);
    if(response!.statusCode == 200){
      isLoading = false;
      login(body.email!, body.password!);
    }else{
      isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> companyRegistration(CreateCompanyAccountBody body) async {
    isLoading = true;
    update();
    Response? response = await authenticationRepository.companyRegistration(body);
    if(response!.statusCode == 200){
      isLoading = false;
      login(body.email!, body.password!);
    }else{
      isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
  }


  UserRolePermissionModel? userRolePermissionModel;
  Future<void> getPermissionList( String id) async {
    Response? response = await authenticationRepository.userRolePermissionList(id);
    if(response!.statusCode == 200){
      userRolePermissionModel = UserRolePermissionModel.fromJson(response.body);

    }else{
      isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();

  }



  Future <void> setUserToken(String token) async{
    authenticationRepository.saveUserToken(token);
  }


  Future <void> setUserType(String type) async{
    authenticationRepository.saveUserType(type);
  }

  RxBool loggedIn = false.obs;
  bool isLoggedIn() {
    return authenticationRepository.isLoggedIn();
  }

  String getToken() {
    return authenticationRepository.getUserToken();
  }

  String getUserType() {
    return authenticationRepository.getUserType();
  }

  bool isActiveRememberMe = false;
  void toggleRememberMe({bool remember = false, bool notify = true}) {
    isActiveRememberMe = remember;
    if(notify){
      update();
    }

  }

  void saveEmailAndPassword(String number, String password) {
    authenticationRepository.saveEmailAndPassword(number, password);
  }
  Future<bool> clearUserEmailAndPassword() async {
    return authenticationRepository.clearUserNumberAndPassword();
  }
  String getEmail() {
    return authenticationRepository.getEmail();
  }
  String getPassword() {
    return authenticationRepository.getPassword();
  }
  Future <bool> clearSharedData() async {
    return authenticationRepository.clearSharedData();
  }

  bool isRegistration = false;
  void setRegistration(bool value){
    isRegistration = value;
    update();
  }

  List<String> roles = [
  'Admin',
  'Company',
  'Candidate',
  ];


  int selectedRoleIndex = 0;
  void setSelectedRoleIndex(int index) {
    selectedRoleIndex = index;
    for(int i = 0; i < genderList.length; i++) {
      genderList[i].isSelected = false;
    }
    genderList[index].isSelected = true;

    update();
  }


  List<GenderModel> genderList = [
    GenderModel(name: 'male'.tr, icon: Icons.male),
    GenderModel(name: 'female'.tr, icon: Icons.female),
    GenderModel(name: 'other'.tr, icon: Icons.transgender),
  ];

  List<String> numberOfEmployees =["1-25", "26-50", "51-100", "101-500", "500-1000", "1000+" ];

  String selectedNumberOfEmployees = "1-25";
  void setSelectedNumberOfEmployees(String value) {
    selectedNumberOfEmployees = value;
    update();
  }

  bool captchaVerified = false;
  void setCaptchaVerified(bool value) {
    captchaVerified = value;
    update();
  }



  XFile? userImage;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      userImage = pickedImage;
    }
    update();
  }



}