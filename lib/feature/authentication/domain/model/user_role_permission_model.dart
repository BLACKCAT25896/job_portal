class UserRolePermissionModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UserRolePermissionModel(
      {this.success, this.statusCode, this.message, this.data, });

  UserRolePermissionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    data['message'] = message;
    data['data'] = this.data?.toJson();
    return data;
  }

}

class Data {
  int? userId;
  String? username;
  String? roleName;
  List<String>? permissions;

  Data({this.userId, this.username, this.roleName, this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    roleName = json['role_name'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = username;
    data['role_name'] = roleName;
    data['permissions'] = permissions;
    return data;
  }

}
