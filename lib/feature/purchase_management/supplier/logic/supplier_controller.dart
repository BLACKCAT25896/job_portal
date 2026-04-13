import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_body.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/repository/supplier_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class SupplierController extends GetxController implements GetxService {
  final SupplierRepository supplierRepository;
  SupplierController({required this.supplierRepository});


  bool isLoading = false;
  ApiResponse<SupplierItem>? supplierModel;
  Future<void> getSupplier(int page, {String search = ""}) async {
    Response? response = await supplierRepository.getSupplier(page, search: search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SupplierItem>.fromJson(response?.body, (json)=> SupplierItem.fromJson(json));
      if(page == 1){
        supplierModel = apiResponse;
      }else{
        supplierModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        supplierModel?.data?.total = apiResponse.data?.total;
        supplierModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  SupplierItem? selectedSupplierItem;
  void setSelectSupplierItem(SupplierItem item, {bool notify = true}){
    selectedSupplierItem = item;
    if(notify) {
      update();
    }
  }

  Future<void> createSupplier(SupplierBody body) async {
    isLoading = true;
    update();
    Response? response = await supplierRepository.createSupplier(body, profileImage);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getSupplier(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editSupplier(SupplierBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await supplierRepository.editSupplier(body, profileImage, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getSupplier(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteSupplier(int id) async {
    Response? response = await supplierRepository.deleteSupplier(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getSupplier(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  XFile? profileImage;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      profileImage = pickedImage;
    }
    update();
  }

}
  