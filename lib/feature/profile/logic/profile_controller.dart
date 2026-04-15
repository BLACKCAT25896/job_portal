import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/profile/domain/model/profile_model.dart';
import 'package:mighty_job/feature/profile/domain/model/status_update_body.dart';
import 'package:mighty_job/feature/profile/domain/repository/profile_repository.dart';
import 'package:mighty_job/feature/side_menu/side_menu_controller.dart';

class ProfileController extends GetxController implements GetxService{
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});



  bool isLoading = false;
  ProfileModel? profileModel;
  bool isStandard = false;
  Future<void> getProfileInfo() async {
    isLoading = true;
    Response? response = await profileRepository.getProfileInfo();
    if (response?.statusCode == 200) {
      profileModel = ProfileModel.fromJson(response?.body);
      Get.find<SideBarController>().refreshMenus();
      if(profileModel != null){
        getDays(profileModel?.data?.subscription?.endDate?? DateTime.now().toString());
        if(profileModel?.data?.subscription?.package?.packageType?.toLowerCase() == "standard"){
          isStandard = true;
        }else{
          isStandard = false;
        }

      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  bool hasPermission(String permission) {
    return profileModel?.data?.permissions?.contains(permission) ?? false;
  }




  Future<void> globalStatusUpdate(StatusUpdateBody body, {
    Future<void> Function()? onSuccess}) async {
    Response? response = await profileRepository.globalStatusUpdate(body);
    if (response?.statusCode == 200) {
      if (onSuccess != null) {
        await onSuccess();
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


  String url = "";
  Future<String> uploadImage (XFile? file) async {
    Response? response = await profileRepository.uploadImage(file);
    if (response?.statusCode == 200 || response?.statusCode == 201) {
      url = "${response?.body["image"]}";
    }else {
      ApiChecker.checkApi(response!);
    }
    update();
    return url;

  }



  int remainDays = 0;
  int getDays(String endDate){
    DateTime now = DateTime.now();
    DateTime lastLogin = DateTime.parse(endDate);
    remainDays = (lastLogin.difference(now).inDays).toInt();
    return remainDays;
  }



  bool _onOff = false;
  bool get onOff => _onOff;
  void changeAnnouncementOnOff(){
    _onOff = !_onOff;
    update();
  }



  Future<void> updateProfile(String name, String email) async {
    isLoading = true;
    Response? response = await profileRepository.updateProfile(name, email);
    if (response?.statusCode == 200) {
      showCustomSnackBar("profile_updated_successfully".tr, isError: false);
     getProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    isLoading = true;
    update();
    Response? response = await profileRepository.changePassword(oldPassword, newPassword);
    if (response?.statusCode == 200) {
      Get.back();
      showCustomSnackBar("password_changed_successfully".tr, isError: false);
      getProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }




}