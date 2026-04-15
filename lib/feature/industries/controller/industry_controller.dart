
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/industries/domain/models/industry_body.dart';
import 'package:ecommerce/feature/industries/domain/models/industry_model.dart';
import 'package:ecommerce/feature/industries/domain/repository/industry_repository.dart';
import 'package:get/get.dart';

class IndustryController extends GetxController implements GetxService{
  final IndustryRepository industryRepository;
  IndustryController({required this.industryRepository});



  bool isLoading = false;
  ApiResponse<IndustryItem>? industryModel;
  Future<void> getIndustryList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await industryRepository.getIndustryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<IndustryItem>.fromJson(response?.body, (json)=>
          IndustryItem.fromJson(json));
      if(offset == 1){
        industryModel = apiResponse;
      }else{
        industryModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        industryModel?.data?.total = apiResponse.data?.total;
        industryModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  IndustryItem? selectedIndustryItem;
  void selectIndustry(IndustryItem? item, {bool notify = true}) {
    selectedIndustryItem = item;
    if(notify) {
      update();
    }
  }


  bool isFeatured = false;
  bool isHot = false;
  bool isOffer = false;

  void toggleIsFeatured({bool notify = true}){
    isFeatured = !isFeatured;
    if(notify) {
      update();
    }
  }
  void toggleIsHot({bool notify = true}){
    isHot = !isHot;
    if(notify) {
      update();
    }
  }

  void toggleIsOffer({bool notify = true}){
    isOffer = !isOffer;
    if(notify) {
      update();
    }

  }




  Future<void> createNewIndustry(IndustryBody industryBody) async {
    isLoading = true;
    update();
    Response? response = await industryRepository.createNewIndustry(industryBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getIndustryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateIndustry(IndustryBody industryBody, int id) async {
    isLoading = true;
    update();
    Response? response = await industryRepository.updateIndustry(industryBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getIndustryList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteIndustry(int id) async {
    isLoading = true;
    Response? response = await industryRepository.deleteIndustry(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getIndustryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}