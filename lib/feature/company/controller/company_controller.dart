
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/company/domain/models/company_body.dart';
import 'package:ecommerce/feature/company/domain/models/company_model.dart';
import 'package:ecommerce/feature/company/domain/repository/company_repository.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController implements GetxService{
  final CompanyRepository companyRepository;
  CompanyController({required this.companyRepository});



  bool isLoading = false;
  ApiResponse<CompanyItem>? companyModel;
  Future<void> getCompanyList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await companyRepository.getCompanyList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CompanyItem>.fromJson(response?.body, (json)=>
          CompanyItem.fromJson(json));
      if(offset == 1){
        companyModel = apiResponse;
      }else{
        companyModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        companyModel?.data?.total = apiResponse.data?.total;
        companyModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  CompanyItem? selectedCompanyItem;
  void selectCompany(CompanyItem? item, {bool notify = true}) {
    selectedCompanyItem = item;
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




  Future<void> createNewCompany(CompanyBody companyBody) async {
    isLoading = true;
    update();
    Response? response = await companyRepository.createNewCompany(companyBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCompanyList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCompany(CompanyBody companyBody, int id) async {
    isLoading = true;
    update();
    Response? response = await companyRepository.updateCompany(companyBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCompanyList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCompany(int id) async {
    isLoading = true;
    Response? response = await companyRepository.deleteCompany(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCompanyList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}