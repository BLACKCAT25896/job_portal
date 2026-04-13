import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/human_resource/attendance/domain/models/attendance_model.dart';
import 'package:ecommerce/feature/human_resource/attendance/domain/repository/attendance_repository.dart';

class AttendanceController extends GetxController implements GetxService{
  final AttendanceRepository attendanceRepository;
  AttendanceController({required this.attendanceRepository});




  bool isLoading = false;
  ApiResponse<AttendanceItem>? attendanceModel;
  Future<void> getAttendanceList(int offset) async {
    Response? response = await attendanceRepository.getAttendanceList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<AttendanceItem>.fromJson(response?.body, (json)=> AttendanceItem.fromJson(json));
      if(offset == 1){
        attendanceModel = apiResponse;
      }else{
        attendanceModel?.data?.data?.addAll(apiResponse.data!.data!);
        attendanceModel?.data?.currentPage = apiResponse.data?.currentPage;
        attendanceModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewAttendance( String name,) async {
    isLoading = true;
    update();
    Response? response = await attendanceRepository.createNewAttendance(name );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getAttendanceList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateAttendance( String name, int id) async {
    isLoading = true;
    update();
    Response? response = await attendanceRepository.updateAttendance(name, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getAttendanceList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteAttendance(int id) async {
    isLoading = true;
    Response? response = await attendanceRepository.deleteAttendance(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getAttendanceList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  AttendanceItem? selectedAttendanceItem;
  void selectAttendance(AttendanceItem item){
    selectedAttendanceItem = item;
    update();
  }
  
}