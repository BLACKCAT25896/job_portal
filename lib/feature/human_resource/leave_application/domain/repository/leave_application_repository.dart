import 'package:ecommerce/feature/human_resource/leave_application/domain/models/leave_application_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class LeaveApplicationRepository{
  final ApiClient apiClient;
  LeaveApplicationRepository({required this.apiClient});


  Future<Response?> getLeaveApplicationList(int page) async {
    return await apiClient.getData("${AppConstants.leaveApplications}?page=$page&perPage=10");
  }

  Future<Response?> createNewLeaveApplication(LeaveApplicationBody body,) async {
    return await apiClient.postData(AppConstants.leaveApplications, body.toJson());
  }

  Future<Response?> updateLeaveApplication( LeaveApplicationBody body, int id) async {
    return await apiClient.putData("${AppConstants.leaveApplications}/$id", body.toJson());
  }
  

  Future<Response?> deleteLeaveApplication (int id) async {
    return await apiClient.deleteData("${AppConstants.leaveApplications}/$id");
  }
}