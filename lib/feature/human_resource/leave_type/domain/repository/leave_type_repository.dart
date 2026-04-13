import 'package:ecommerce/feature/human_resource/leave_type/domain/models/leave_type_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';

class LeaveTypeRepository{
  final ApiClient apiClient;
  LeaveTypeRepository({required this.apiClient});


  Future<Response?> getLeaveTypeList(int page) async {
    return await apiClient.getData("${AppConstants.leaveTypes}?page=$page&perPage=10");
  }

  Future<Response?> createNewLeaveType( LeaveTypeBody body,) async {
    return await apiClient.postData(AppConstants.leaveTypes, body.toJson());
  }

  Future<Response?> updateLeaveType(LeaveTypeBody body,int id) async {
    return await apiClient.putData("${AppConstants.leaveTypes}/$id", body.toJson());
  }
  

  Future<Response?> deleteLeaveType (int id) async {
    return await apiClient.deleteData("${AppConstants.leaveTypes}/$id");
  }
}