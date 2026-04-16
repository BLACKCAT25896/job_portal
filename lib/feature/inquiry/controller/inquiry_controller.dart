
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/inquiry/domain/models/inquiry_body.dart';
import 'package:mighty_job/feature/inquiry/domain/models/inquiry_model.dart';
import 'package:mighty_job/feature/inquiry/domain/repository/inquiry_repository.dart';

class InquiryController extends GetxController implements GetxService{
  final InquiryRepository inquiryRepository;
  InquiryController({required this.inquiryRepository});



  bool isLoading = false;
  ApiResponse<InquiryItem>? inquiryModel;
  Future<void> getInquiryList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await inquiryRepository.getInquiryList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<InquiryItem>.fromJson(response?.body, (json)=>
          InquiryItem.fromJson(json));
      if(offset == 1){
        inquiryModel = apiResponse;
      }else{
        inquiryModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        inquiryModel?.data?.total = apiResponse.data?.total;
        inquiryModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  InquiryItem? selectedInquiryItem;
  void selectInquiry(InquiryItem? item, {bool notify = true}) {
    selectedInquiryItem = item;
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




  Future<void> createNewInquiry(InquiryBody inquiryBody) async {
    isLoading = true;
    update();
    Response? response = await inquiryRepository.createNewInquiry(inquiryBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getInquiryList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateInquiry(InquiryBody inquiryBody, int id) async {
    isLoading = true;
    update();
    Response? response = await inquiryRepository.updateInquiry(inquiryBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getInquiryList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteInquiry(int id) async {
    isLoading = true;
    Response? response = await inquiryRepository.deleteInquiry(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getInquiryList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}