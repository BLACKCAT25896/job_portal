import 'dart:developer';
import 'dart:io';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:ecommerce/feature/inventory/brand/domain/repository/brand_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BrandController extends GetxController implements GetxService{
final BrandRepository brandRepository;
BrandController({required this.brandRepository});

  XFile? thumbnail;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
     double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      thumbnail = pickedImage;
    }
    update();
  }


  bool isLoading = false;
  BrandModel? brandModel;
  Future<void> getBrandList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await brandRepository.getBrandList(offset, search);
    if (response?.statusCode == 200) {
      if(offset == 1){
        brandModel = BrandModel.fromJson(response?.body);
      }else{
        brandModel?.data?.data?.addAll(BrandModel.fromJson(response?.body).data!.data!);
        brandModel?.data?.currentPage = BrandModel.fromJson(response?.body).data?.currentPage;
        brandModel?.data?.total = BrandModel.fromJson(response?.body).data?.total;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

BrandItem? selectedBrandItem;
void selectBrand(BrandItem item, {bool notify = true}) {
  selectedBrandItem = item;
  if(notify) {
    update();
  }
}

Future<void> createNewBrand( String name, String description,) async {
  isLoading = true;
  update();
  Response? response = await brandRepository.createNewBrand(name, description, thumbnail);
  if(response!.statusCode == 200){
    thumbnail = null;
    getBrandList(1);
    isLoading = false;
    Get.back();
    showCustomSnackBar("brand_created_successfully".tr, isError: false);

  }else{
    ApiChecker.checkApi(response);
  }
  isLoading = false;
  update();

}

Future<void> updateBrand( String name, String description, int id) async {
  isLoading = true;
  update();
  Response? response = await brandRepository.updateNewBrand(name, description, thumbnail, id);
  if(response!.statusCode == 200){
    thumbnail = null;
    getBrandList(1);
    isLoading = false;
    Get.back();
    showCustomSnackBar("brand_updated_successfully".tr, isError: false);
  }else{
    ApiChecker.checkApi(response);
  }
  isLoading = false;
  update();

}




Future<void> deleteBrand(int id) async {
  isLoading = true;
  Response? response = await brandRepository.deleteBrand(id);
  if (response?.statusCode == 200) {
    showCustomSnackBar("brand_deleted_successfully".tr, isError: false);
    getBrandList(1);
    isLoading = false;
  }else{
    isLoading = false;
    ApiChecker.checkApi(response!);
  }
  update();
}



Future<XFile?> compressAndGetWebpFile(File file, String targetPath) async {
  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path, targetPath,
    quality: 88,
    rotate: 0,
    format: CompressFormat.webp,
  );
  log(file.lengthSync().toString());
  return result;
}

}