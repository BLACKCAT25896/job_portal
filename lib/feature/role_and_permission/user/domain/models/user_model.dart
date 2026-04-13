class UserItem {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? avatar;
  String? status;
  String? roleId;
  String? userType;
  String? createdBy;

  UserItem(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.avatar,
        this.status,
        this.roleId,
        this.userType,
        this.createdBy});

  UserItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    avatar = json['avatar'];
    status = json['status'].toString();
    roleId = json['role_id'].toString();
    userType = json['user_type'].toString();
    createdBy = json['created_by'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['avatar'] = avatar;
    data['status'] = status;
    data['role_id'] = roleId;
    data['user_type'] = userType;
    data['created_by'] = createdBy;
    return data;
  }
}