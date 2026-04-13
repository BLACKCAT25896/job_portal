import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_body.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/repository/customer_repository.dart';
import 'package:ecommerce/helper/image_size_checker.dart';

class CustomerController extends GetxController implements GetxService {
  final CustomerRepository customerRepository;
  CustomerController({required this.customerRepository});


  bool isLoading = false;
  ApiResponse<CustomerItem>? customerModel;
  Future<void> getCustomer(int page, {String search = ""}) async {
    Response? response = await customerRepository.getCustomer(page, search: search);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CustomerItem>.fromJson(response?.body, (json)=> CustomerItem.fromJson(json));
      if(page == 1){
        customerModel = apiResponse;
      }else{
        customerModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        customerModel?.data?.total = apiResponse.data?.total;
        customerModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CustomerItem? selectedCustomerItem;
  void setSelectCustomerItem(CustomerItem item, {bool notify = true}){
    selectedCustomerItem = item;
    if(notify) {
      update();
    }
  }

  Future<void> createCustomer(CustomerBody body) async {
    isLoading = true;
    update();
    Response? response = await customerRepository.createCustomer(body, thumbnail);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCustomer(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editCustomer(CustomerBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await customerRepository.editCustomer(body, thumbnail, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCustomer(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteCustomer(int id) async {
    Response? response = await customerRepository.deleteCustomer(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCustomer(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }

  XFile? thumbnail;
  XFile? pickedImage;
  void pickImage({bool icon = false}) async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      thumbnail = pickedImage;
    }
    update();
  }

}
  