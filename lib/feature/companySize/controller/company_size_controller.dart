
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/companySize/domain/models/company_size_body.dart';
import 'package:mighty_job/feature/companySize/domain/models/company_size_model.dart';
import 'package:mighty_job/feature/companySize/domain/repository/company_size_repository.dart';
import 'package:get/get.dart';

class CompanySizeController extends GetxController implements GetxService{
  final CompanySizeRepository companySizeRepository;
  CompanySizeController({required this.companySizeRepository});



  bool isLoading = false;
  ApiResponse<CompanySizeItem>? companySizeModel;
  Future<void> getCompanySizeList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await companySizeRepository.getCompanySizeList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CompanySizeItem>.fromJson(response?.body, (json)=>
          CompanySizeItem.fromJson(json));
      if(offset == 1){
        companySizeModel = apiResponse;
      }else{
        companySizeModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        companySizeModel?.data?.total = apiResponse.data?.total;
        companySizeModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  CompanySizeItem? selectedCompanySizeItem;
  void selectCompanySize(CompanySizeItem? item, {bool notify = true}) {
    selectedCompanySizeItem = item;
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




  Future<void> createNewCompanySize(CompanySizeBody companySizeBody) async {
    isLoading = true;
    update();
    Response? response = await companySizeRepository.createNewCompanySize(companySizeBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCompanySizeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCompanySize(CompanySizeBody companySizeBody, int id) async {
    isLoading = true;
    update();
    Response? response = await companySizeRepository.updateCompanySize(companySizeBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCompanySizeList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCompanySize(int id) async {
    isLoading = true;
    Response? response = await companySizeRepository.deleteCompanySize(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCompanySizeList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}