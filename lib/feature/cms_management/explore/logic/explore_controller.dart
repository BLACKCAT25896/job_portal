import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/cms_management/explore/domain/model/explore_model.dart';
import 'package:ecommerce/feature/cms_management/explore/domain/repository/explore_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class ExploreController extends GetxController implements GetxService {
  final ExploreRepository benefitRepository;
  ExploreController({required this.benefitRepository});

  ApiResponse<ExploreItem>? exploreModel;
  Future<void> getExplore(int page) async {
    Response? response = await benefitRepository.getExplore(page);
    if (response?.statusCode == 200) {
      final apiData = ApiResponse<ExploreItem>.fromJson(response?.body, (json) => ExploreItem.fromJson(json));
      if(page == 1) {
        exploreModel = apiData;
      } else {
        exploreModel?.data?.data?.addAll(apiData.data?.data ?? []);
        exploreModel?.data?.total = apiData.data?.total;
        exploreModel?.data?.currentPage = apiData.data?.currentPage;
      }

    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  XFile? benefitImage;
  XFile? pickedImage;
  void pickImage({bool parentIdProof = false}) async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      benefitImage = pickedImage;
    }
    update();
  }
  bool loading = false;
  Future<void> createExplore(String title, String description) async {
    loading = true;
    update();
    Response? response = await benefitRepository.createExplore(title, description, benefitImage);
    if (response?.statusCode == 200) {
      loading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getExplore(1);
    } else {
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  Future<void> editExplore(String title, String description, int id) async {
    loading = true;
    update();
    Response? response = await benefitRepository.editExplore(title, description, benefitImage, id);
    if (response?.statusCode == 200) {
      loading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getExplore(1);
    } else {
      loading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteExplore(int id) async {
    Response? response = await benefitRepository.deleteExplore(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getExplore(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }
}
  