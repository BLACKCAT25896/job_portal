class UserBody {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  int? roleId;
  String? password;
  String? passwordConfirmation;
  String? sMethod;

  UserBody(
      {this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.roleId,
        this.password,
        this.passwordConfirmation,
        this.sMethod
      });

  UserBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    roleId = json['role_id'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['role_id'] = roleId;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['_method'] = sMethod;
    return data;
  }
}
