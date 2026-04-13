import 'dart:developer';

import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/feature/authentication/domain/model/user_role_permission_model.dart';
import 'package:ecommerce/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/route_helper.dart';

class AuthenticationController extends GetxController implements GetxService{
  final AuthenticationRepository authenticationRepository;
  AuthenticationController({required this.authenticationRepository});



  void updateToken() {
    authenticationRepository.updateToken();
  }



  bool isLoading = false;
  Future<void> login( String email, String password, {bool fromDashboard = false}) async {
    isLoading = true;
    update();
    Response? response = await authenticationRepository.login(email: email, password: password);
    log("status code==>${response?.statusCode}");
    if(response!.statusCode == 200){
      isLoading = false;
      setUserToken(response.body['data']['access_token']);
      setUserType(response.body['data']["user"]['user_type'].toString());
      await Get.find<ProfileController>().getProfileInfo().then((val){
        Get.offAllNamed(RouteHelper.getDashboardRoute());
        updateToken();
      });

    }else{
      isLoading = false;
      ApiChecker.checkApi(response);
    }
    if(!fromDashboard) {
      update();
    }

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
  'Owner',
  'Manager',
  'Employee',
  ];


  int selectedRoleIndex = 0;
  void setSelectedRoleIndex(int index) {
    selectedRoleIndex = index;
    update();
  }

}