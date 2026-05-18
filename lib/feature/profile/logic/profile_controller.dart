import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job/api_handle/api_checker.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/authentication/domain/model/create_company_account_body.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/domain/model/status_update_body.dart';
import 'package:job/feature/profile/domain/repository/profile_repository.dart';
import 'package:job/feature/side_menu/side_menu_controller.dart';
import 'package:job/helper/image_size_checker.dart';

class ProfileController extends GetxController implements GetxService{
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});



  bool isLoading = false;
  ProfileModel? profileModel;
  Future<void> getProfileInfo() async {
    isLoading = true;
    Response? response = await profileRepository.getProfileInfo();
    if (response?.statusCode == 200) {
      profileModel = ProfileModel.fromJson(response?.body);
      Get.find<SideBarController>().refreshMenus();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }



  Future<void> getCandidateProfileInfo() async {
    isLoading = true;
    Response? response = await profileRepository.getCandidateProfileInfo();
    if (response?.statusCode == 200) {
      profileModel = ProfileModel.fromJson(response?.body);
      Get.find<SideBarController>().refreshMenus();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  Future<void> getCompanyProfileInfo() async {
    isLoading = true;
    Response? response = await profileRepository.getCompanyProfileInfo();
    if (response?.statusCode == 200) {
      profileModel = ProfileModel.fromJson(response?.body);
      Get.find<SideBarController>().refreshMenus();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
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
      showCustomSnackBar("updated_successfully".tr, isError: false);
     getProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> updateCompanyProfile(CreateCompanyAccountBody body) async {
    isLoading = true;
    Response? response = await profileRepository.updateCompanyProfile(body);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCompanyProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> updateCandidateProfile(CandidateInfo body) async {
    isLoading = true;
    update();
    Response? response = await profileRepository.updateCandidateInfo(body);
    if (response?.statusCode == 200) {
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }




  Future<void> updateProfileAvatar() async {
    isLoading = true;
    Response? response = await profileRepository.avatarUpdateProfile(profileAvatar);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> updateCompanyLogo() async {
    isLoading = true;
    Response? response = await profileRepository.companyLogoUpdate(profileAvatar);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCompanyProfileInfo();
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
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getProfileInfo();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  XFile? profileAvatar;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      profileAvatar = pickedImage;
    }
    update();
  }





}