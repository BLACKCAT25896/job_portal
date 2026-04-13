import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class WeeklyHolidayRepository{
  final ApiClient apiClient;
  WeeklyHolidayRepository({required this.apiClient});


  Future<Response?> getWeeklyHolidayList(int page) async {
    return await apiClient.getData("${AppConstants.weeklyHolidays}?page=$page&perPage=10");
  }

  Future<Response?> createNewWeeklyHoliday( String name,) async {
    Map<String, String> fields = <String, String> {
      'day': name,
      'status': "1",
    };

    return await apiClient.postData(AppConstants.weeklyHolidays, fields);
  }

  Future<Response?> updateWeeklyHoliday( String name, int id) async {
    Map<String, String> fields = <String, String> {
      'day': name,
      'status': "1",
    };
    return await apiClient.putData("${AppConstants.weeklyHolidays}/$id", fields);
  }
  

  Future<Response?> deleteWeeklyHoliday (int id) async {
    return await apiClient.deleteData("${AppConstants.weeklyHolidays}/$id");
  }
}