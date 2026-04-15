import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/models/user_body.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/repository/user_repository.dart';
import 'package:mighty_job/helper/image_size_checker.dart';

class UserController extends GetxController implements GetxService{
  final UserRepository userRepository;
  UserController({required this.userRepository});




  bool isLoading = false;
  ApiResponse<UserItem>? userModel;
  Future<void> getUserList(int offset, {String search = "", String userType = ""}) async {
    Response? response = await userRepository.getUserList(offset, search: search, userType: userType);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<UserItem>.fromJson(response?.body, (json)=> UserItem.fromJson(json));
      if(offset == 1){
        userModel = apiResponse;
      }else{
        userModel?.data?.data?.addAll(apiResponse.data!.data!);
        userModel?.data?.currentPage = apiResponse.data?.currentPage;
        userModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewUser(UserBody body) async {
    isLoading = true;
    update();
    Response? response = await userRepository.createNewUser(body, userImage );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getUserList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateUser( UserBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await userRepository.updateUser(body, userImage, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getUserList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteUser(int id) async {
    isLoading = true;
    Response? response = await userRepository.deleteUser(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getUserList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  UserItem? selectedUserItem;
  void selectUser(UserItem item, {bool notify = true}){
    selectedUserItem = item;
    if(notify) {
      update();
    }
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