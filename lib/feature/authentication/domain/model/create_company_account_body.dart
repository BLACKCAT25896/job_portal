class CreateCompanyAccountBody {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  int? industryId;
  String? companyName;
  String? website;
  String? location;

  CreateCompanyAccountBody(
      {this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.password,
        this.passwordConfirmation,
        this.industryId,
        this.companyName,
        this.website,
        this.location});

  CreateCompanyAccountBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    industryId = json['industry_id'];
    companyName = json['company_name'];
    website = json['website'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['industry_id'] = industryId;
    data['company_name'] = companyName;
    data['website'] = website;
    data['location'] = location;
    return data;
  }
}
