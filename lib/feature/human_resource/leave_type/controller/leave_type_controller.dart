import 'package:mighty_job/feature/human_resource/leave_type/domain/models/leave_type_body.dart';
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/human_resource/leave_type/domain/models/leave_type_model.dart';
import 'package:mighty_job/feature/human_resource/leave_type/domain/repository/leave_type_repository.dart';

class LeaveTypeController extends GetxController implements GetxService{
  final LeaveTypeRepository leaveTypeRepository;
  LeaveTypeController({required this.leaveTypeRepository});




  bool isLoading = false;
  ApiResponse<LeaveTypeItem>? leaveTypeModel;
  Future<void> getLeaveTypeList(int offset) async {
    Response? response = await leaveTypeRepository.getLeaveTypeList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<LeaveTypeItem>.fromJson(response?.body, (json)=> LeaveTypeItem.fromJson(json));
      if(offset == 1){
        leaveTypeModel = apiResponse;
      }else{
        leaveTypeModel?.data?.data?.addAll(apiResponse.data!.data!);
        leaveTypeModel?.data?.currentPage = apiResponse.data?.currentPage;
        leaveTypeModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewLeaveType(LeaveTypeBody body,) async {
    isLoading = true;
    update();
    Response? response = await leaveTypeRepository.createNewLeaveType(body );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getLeaveTypeList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateLeaveType(LeaveTypeBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await leaveTypeRepository.updateLeaveType(body, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getLeaveTypeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteLeaveType(int id) async {
    isLoading = true;
    Response? response = await leaveTypeRepository.deleteLeaveType(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getLeaveTypeList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  LeaveTypeItem? selectedLeaveTypeItem;
  void selectLeaveType(LeaveTypeItem item){
    selectedLeaveTypeItem = item;
    update();
  }
  bool isPaid = false;
  void toggleIsPaid(bool val, {bool notify = true}){
    isPaid = val;
    if(notify) {
      update();
    }
  }
  bool carryForward = false;
  void toggleCarryForward(bool val, {bool notify = true}){
    carryForward = val;
    if(notify) {
      update();
    }
  }
  
}