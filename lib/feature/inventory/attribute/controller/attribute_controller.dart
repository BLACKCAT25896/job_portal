import 'dart:developer';
import 'dart:io';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/repository/attribute_repository.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';

class AttributeController extends GetxController implements GetxService{
final AttributeRepository attributeRepository;
AttributeController({required this.attributeRepository});


  bool isLoading = false;
  ApiResponse<AttributeItem>? attributeModel;
  Future<void> getAttributeList(int offset, {String search = ""}) async {
    isLoading = true;
    Response? response = await attributeRepository.getAttributeList(offset, search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<AttributeItem>.fromJson(response?.body,
              (json)=> AttributeItem.fromJson(json));
      if(offset == 1){
        attributeModel = apiResponse;
      }else{
        attributeModel?.data?.data?.addAll(apiResponse.data?.data?? []);
        attributeModel?.data?.currentPage = apiResponse.data?.currentPage;
        attributeModel?.data?.total = apiResponse.data?.total;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

AttributeItem? selectedAttributeItem;
  void selectAttribute(AttributeItem item, {bool notify = true}){
    selectedAttributeItem = item;
    Get.find<AttributeValueController>().getAttributeValueList(1,
        Get.find<AttributeController>().selectedAttributeItem?.id??0);
    if(notify) {
      update();
    }
  }



Future<void> createNewAttribute( String name,) async {
  isLoading = true;
  update();
  Response? response = await attributeRepository.createNewAttribute(name);
  if(response!.statusCode == 200){
    getAttributeList(1);
    isLoading = false;
    Get.back();
    showCustomSnackBar("attribute_created_successfully".tr, isError: false);

  }else{
    ApiChecker.checkApi(response);
  }
  isLoading = false;
  update();

}

Future<void> updateAttribute( String name, int id) async {
  isLoading = true;
  update();
  Response? response = await attributeRepository.updateNewAttribute(name, id);
  if(response!.statusCode == 200){
    getAttributeList(1);
    isLoading = false;
    Get.back();
    showCustomSnackBar("attribute_updated_successfully".tr, isError: false);
  }else{
    ApiChecker.checkApi(response);
  }
  isLoading = false;
  update();

}


Future<void> deleteAttribute(int id) async {
  isLoading = true;
  Response? response = await attributeRepository.deleteAttribute(id);
  if (response?.statusCode == 200) {
    showCustomSnackBar("attribute_deleted_successfully".tr, isError: false);
    getAttributeList(1);
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