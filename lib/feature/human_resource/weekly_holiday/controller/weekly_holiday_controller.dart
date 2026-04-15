import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/human_resource/weekly_holiday/domain/models/weekly_holiday_model.dart';
import 'package:mighty_job/feature/human_resource/weekly_holiday/domain/repository/weekly_holiday_repository.dart';

class WeeklyHolidayController extends GetxController implements GetxService{
  final WeeklyHolidayRepository weeklyHolidayRepository;
  WeeklyHolidayController({required this.weeklyHolidayRepository});




  bool isLoading = false;
  ApiResponse<WeeklyHolidayItem>? weeklyHolidayModel;
  Future<void> getWeeklyHolidayList(int offset) async {
    Response? response = await weeklyHolidayRepository.getWeeklyHolidayList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<WeeklyHolidayItem>.fromJson(response?.body, (json)=> WeeklyHolidayItem.fromJson(json));
      if(offset == 1){
        weeklyHolidayModel = apiResponse;
      }else{
        weeklyHolidayModel?.data?.data?.addAll(apiResponse.data!.data!);
        weeklyHolidayModel?.data?.currentPage = apiResponse.data?.currentPage;
        weeklyHolidayModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createNewWeeklyHoliday( String name,) async {
    isLoading = true;
    update();
    Response? response = await weeklyHolidayRepository.createNewWeeklyHoliday(name );
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getWeeklyHolidayList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateWeeklyHoliday( String name, int id) async {
    isLoading = true;
    update();
    Response? response = await weeklyHolidayRepository.updateWeeklyHoliday(name, id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getWeeklyHolidayList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteWeeklyHoliday(int id) async {
    isLoading = true;
    Response? response = await weeklyHolidayRepository.deleteWeeklyHoliday(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getWeeklyHolidayList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  WeeklyHolidayItem? selectedWeeklyHolidayItem;
  void selectWeeklyHoliday(WeeklyHolidayItem item){
    selectedWeeklyHolidayItem = item;
    update();
  }

  List<String> days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  String selectedDay  = "Friday";
  void selectDay(String day, {bool notify = true}){
    selectedDay = day;
    if(notify) {
      update();
    }
  }
  
}