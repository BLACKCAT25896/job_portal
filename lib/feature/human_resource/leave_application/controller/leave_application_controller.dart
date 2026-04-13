import 'package:ecommerce/feature/human_resource/leave_application/domain/models/leave_application_body.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/leave_application/domain/models/leave_application_model.dart';
import 'package:ecommerce/feature/human_resource/leave_application/domain/repository/leave_application_repository.dart';

class LeaveApplicationController extends GetxController implements GetxService{
  final LeaveApplicationRepository leaveApplicationRepository;
  LeaveApplicationController({required this.leaveApplicationRepository});




  bool isLoading = false;
  ApiResponse<LeaveApplicationItem>? leaveApplicationModel;
  Future<void> getLeaveApplicationList(int offset) async {
    Response? response = await leaveApplicationRepository.getLeaveApplicationList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<LeaveApplicationItem>.fromJson(response?.body, (json)=> LeaveApplicationItem.fromJson(json));
      if(offset == 1){
        leaveApplicationModel = apiResponse;
      }else{
        leaveApplicationModel?.data?.data?.addAll(apiResponse.data!.data!);
        leaveApplicationModel?.data?.currentPage = apiResponse.data?.currentPage;
        leaveApplicationModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewLeaveApplication( LeaveApplicationBody body,) async {
    isLoading = true;
    update();
    Response? response = await leaveApplicationRepository.createNewLeaveApplication(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getLeaveApplicationList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateLeaveApplication( LeaveApplicationBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await leaveApplicationRepository.updateLeaveApplication(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLeaveApplicationList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteLeaveApplication(int id) async {
    isLoading = true;
    Response? response = await leaveApplicationRepository.deleteLeaveApplication(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getLeaveApplicationList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  LeaveApplicationItem? selectedLeaveApplicationItem;
  void selectLeaveApplication(LeaveApplicationItem item){
    selectedLeaveApplicationItem = item;
    update();
  }

  List<String> durationTypes = ["full_day", "half_day"];
  String selectedDurationType = "full_day";
  void selectDurationType(String value){
    selectedDurationType = value;
    update();
  }
  
}