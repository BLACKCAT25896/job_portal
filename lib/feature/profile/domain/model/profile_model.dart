class ProfileModel {
  bool? status;
  String? message;
  ProfileInfo? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProfileInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileInfo {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? role;
  bool? status;
  List<String>? permissions;

  ProfileInfo(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.role,
        this.status,
        this.permissions});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    role = json['role'];
    status = json['status'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['role'] = role;
    data['status'] = status;
    data['permissions'] = permissions;
    return data;
  }
}
