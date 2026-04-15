import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/util/app_constants.dart';

class AttendanceRepository{
  final ApiClient apiClient;
  AttendanceRepository({required this.apiClient});


  Future<Response?> getAttendanceList(int page) async {
    return await apiClient.getData("${AppConstants.employeeAttendance}?page=$page&perPage=10");
  }

  Future<Response?> createNewAttendance( String name,) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      'status': "1",
    };

    return await apiClient.postData(AppConstants.employeeAttendance, fields);
  }

  Future<Response?> updateAttendance( String name, int id) async {
    Map<String, String> fields = <String, String> {
      'name': name,
      'status': "1",
    };
    return await apiClient.putData("${AppConstants.employeeAttendance}/$id", fields);
  }
  

  Future<Response?> deleteAttendance (int id) async {
    return await apiClient.deleteData("${AppConstants.employeeAttendance}/$id");
  }
}