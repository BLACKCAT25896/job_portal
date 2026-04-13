import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/domain/model/policy_model.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/domain/repository/policy_pages_repository.dart';

class PagesController extends GetxController implements GetxService {
  final PagesRepository pagesRepository;
  PagesController({required this.pagesRepository});

  ApiResponse<PagesItem>?pageModel;
  int selectedPageIndex = 0;
  Future<void> getPages(int page) async {
    Response? response = await pagesRepository.getPage(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<PagesItem>.fromJson(response!.body, (json)=> PagesItem.fromJson(json));
      if(page == 1) {
       pageModel = apiResponse;
      }else{
       pageModel?.data?.data?.addAll(apiResponse.data?.data??[]);
       pageModel?.data?.total = apiResponse.data?.total;
       pageModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }

    update();
  }

  void setSelectedPageIndex(int index) async {
    selectedPageIndex = index;
    update();
  }

  bool isLoading = false;

  Future<void> editPages(int id, String type, String description) async {
    isLoading = true;
    update();
    Response? response = await pagesRepository.editPage(id, type, description);
    if (response?.statusCode == 200) {
      await getPages(1);
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
    } else {
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
  }

  Future<void> addNewPage( String type, String description) async {
    isLoading = true;
    update();
    Response? response = await pagesRepository.addNewPage(type, description);
    if (response?.statusCode == 200) {
      await getPages(1);
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
    } else {
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
  }

  Future<void> deletePage(int id) async {
    Response? response = await pagesRepository.deletePages(id);
    if (response?.statusCode == 200) {
      await getPages(1);
      showCustomSnackBar("updated_successfully".tr, isError: false);
    } else {
      ApiChecker.checkApi(response!);
    }

    update();
  }

}
