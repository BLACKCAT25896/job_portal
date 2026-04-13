import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/repository/attribute_value_repository.dart';
import 'package:get/get.dart';

class AttributeValueController extends GetxController implements GetxService{
final AttributeValueRepository attributeValueRepository;
AttributeValueController({required this.attributeValueRepository});


  bool isLoading = false;
  ApiResponse<AttributeValueItem>? attributeValueModel;
  Future<void> getAttributeValueList(int offset, int attributeId) async {
    isLoading = true;
    Response? response = await attributeValueRepository.getAttributeValueList(offset, attributeId);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<AttributeValueItem>.fromJson(response?.body,
              (json)=> AttributeValueItem.fromJson(json));
      if(offset == 1){
        attributeValueModel = apiResponse;
      }else{
        attributeValueModel?.data?.data?.addAll(apiResponse.data?.data?? []);
        attributeValueModel?.data?.currentPage = apiResponse.data?.currentPage;
        attributeValueModel?.data?.total = apiResponse.data?.total;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  AttributeValueItem? selectedAttributeValueItem;
  void selectAttributeValue(AttributeValueItem item){
    selectedAttributeValueItem = item;
    update();
  }


Future<void> createNewAttributeValue(int attributeId, String value) async {
  isLoading = true;
  update();
  Response? response = await attributeValueRepository.createNewAttributeValue(attributeId, value);
  if(response!.statusCode == 200){
    getAttributeValueList(1, Get.find<AttributeController>().selectedAttributeItem?.id??0);
    isLoading = false;
    Get.back();
    showCustomSnackBar("created_successfully".tr, isError: false);

  }else{
    ApiChecker.checkApi(response);
  }
  isLoading = false;
  update();

}

Future<void> updateAttributeValue(int attributeId, String value, int id) async {
  isLoading = true;
  update();
  Response? response = await attributeValueRepository.updateNewAttributeValue(attributeId, value, id);
  if(response!.statusCode == 200){
    getAttributeValueList(1, Get.find<AttributeController>().selectedAttributeItem?.id??0);
    isLoading = false;
    Get.back();
    showCustomSnackBar("updated_successfully".tr, isError: false);
  }else{
    ApiChecker.checkApi(response);
  }
  isLoading = false;
  update();

}


Future<void> deleteAttributeValue(int id) async {
  isLoading = true;
  Response? response = await attributeValueRepository.deleteAttributeValue(id);
  if (response?.statusCode == 200) {
    showCustomSnackBar("deleted_successfully".tr, isError: false);
    getAttributeValueList(1, Get.find<AttributeController>().selectedAttributeItem?.id??0);
    isLoading = false;
  }else{
    isLoading = false;
    ApiChecker.checkApi(response!);
  }
  update();
}

}