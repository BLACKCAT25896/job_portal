
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/ownership_type/domain/models/ownership_type_body.dart';
import 'package:mighty_job/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:mighty_job/feature/ownership_type/domain/repository/ownership_type_repository.dart';
import 'package:get/get.dart';

class OwnershipTypeController extends GetxController implements GetxService{
  final OwnershipTypeRepository ownershipTypeRepository;
  OwnershipTypeController({required this.ownershipTypeRepository});



  bool isLoading = false;
  ApiResponse<OwnershipTypeItem>? ownershipTypeModel;
  Future<void> getOwnershipTypeList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await ownershipTypeRepository.getOwnershipTypeList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<OwnershipTypeItem>.fromJson(response?.body, (json)=>
          OwnershipTypeItem.fromJson(json));
      if(offset == 1){
        ownershipTypeModel = apiResponse;
      }else{
        ownershipTypeModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        ownershipTypeModel?.data?.total = apiResponse.data?.total;
        ownershipTypeModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  OwnershipTypeItem? selectedOwnershipTypeItem;
  void selectOwnershipType(OwnershipTypeItem? item, {bool notify = true}) {
    selectedOwnershipTypeItem = item;
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




  Future<void> createNewOwnershipType(OwnershipTypeBody ownershipTypeBody) async {
    isLoading = true;
    update();
    Response? response = await ownershipTypeRepository.createNewOwnershipType(ownershipTypeBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getOwnershipTypeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateOwnershipType(OwnershipTypeBody ownershipTypeBody, int id) async {
    isLoading = true;
    update();
    Response? response = await ownershipTypeRepository.updateOwnershipType(ownershipTypeBody, id);
    if(response!.statusCode == 200){
      isLoading = false;
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getOwnershipTypeList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteOwnershipType(int id) async {
    isLoading = true;
    Response? response = await ownershipTypeRepository.deleteOwnershipType(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getOwnershipTypeList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
  
}