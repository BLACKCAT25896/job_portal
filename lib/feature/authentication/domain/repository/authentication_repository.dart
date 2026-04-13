import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/authentication/domain/model/create_account_body.dart';
import 'package:ecommerce/util/app_constants.dart';

class AuthenticationRepository{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthenticationRepository( {required this.apiClient, required this.sharedPreferences,});

  Future<Response?> login({required String email, required String password}) async {
    return await apiClient.postData(AppConstants.loginUri,
        {"login": email, "password": password});
  }


  Future<Response?> registration(CreateAccountBody createAccountBody) async {
    return await apiClient.postData(AppConstants.registration, createAccountBody.toJson());
  }


  Future<Response?> userRolePermissionList(String id) async {
    return await apiClient.getData("");
  }

  Future<bool?> saveUserToken(String token) async {
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);

  }





  Future<bool?> saveUserType(String type) async {
    return await sharedPreferences.setString(AppConstants.useType, type);

  }
  String getUserType() {
    return sharedPreferences.getString(AppConstants.useType) ?? "";
  }


  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }
  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<void> saveEmailAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.userPassword, password);
      await sharedPreferences.setString(AppConstants.userNumber, number);

    } catch (e) {
      rethrow;
    }
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.userNumber);
    return await sharedPreferences.remove(AppConstants.userPassword);
  }

  String getEmail() {
    return sharedPreferences.getString(AppConstants.userNumber) ?? "";
  }
  String getPassword() {
    return sharedPreferences.getString(AppConstants.userPassword) ?? "";
  }


  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    return true;
  }


  Future<Response> updateToken({String notificationDeviceToken = ''}) async {
    String? deviceToken;
    if(notificationDeviceToken.isEmpty){
      if (GetPlatform.isIOS && !GetPlatform.isWeb) {
        FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
        NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
          alert: true, announcement: false, badge: true, carPlay: false,
          criticalAlert: false, provisional: false, sound: true,
        );
        if(settings.authorizationStatus == AuthorizationStatus.authorized) {
          deviceToken = await _saveDeviceToken();
        }
      }else {
        deviceToken = await _saveDeviceToken();
      }
      if(!GetPlatform.isWeb) {
        FirebaseMessaging.instance.subscribeToTopic(AppConstants.topic);
      }
    }
    return await apiClient.postData(AppConstants.tokenUri, { "token": notificationDeviceToken.isNotEmpty ? notificationDeviceToken : deviceToken});
  }

  Future<String?> _saveDeviceToken() async {
    //BGvbfIkEn80a8STCbBPdr-S8QNtjrZfrs-UH7-sZgDDpr_LDfxCsx4n-pC-kUh2jqpWLwEvoAti0AyFYLcvQhng
    String? deviceToken = '@';
    if(GetPlatform.isWeb) {
      deviceToken = await FirebaseMessaging.instance.getToken(
        vapidKey: AppConstants.vapidKey,
      );
    }else{
      try {
        deviceToken = (await FirebaseMessaging.instance.getToken())!;
      }catch(_) {}
    }
    if (deviceToken != null) {
      log('--------Device Token---------- $deviceToken');
    }
    return deviceToken;
  }
  //
  // void setNotificationActive(bool isActive) {
  //   if(isActive) {
  //     updateToken();
  //   }else {
  //     if(!GetPlatform.isWeb) {
  //       updateToken(notificationDeviceToken: '@');
  //       FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.topic);
  //       if(isLoggedIn()) {
  //         FirebaseMessaging.instance.unsubscribeFromTopic('zone_${Get.find<LocationController>().getUserAddress()!.zoneId}_customer');
  //       }
  //     }
  //   }
  //   sharedPreferences.setBool(AppConstants.notification, isActive);
  // }

}