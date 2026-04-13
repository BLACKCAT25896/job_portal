class CreateAccountBody {
  String? ownerName;
  String? shopName;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  String? businessType;
  String? language;
  String? address;
  String? businessIndustry;

  CreateAccountBody(
      {this.ownerName,
        this.shopName,
        this.email,
        this.phone,
        this.password,
        this.passwordConfirmation,
        this.businessType,
        this.language,
        this.address,
        this.businessIndustry
      });

  CreateAccountBody.fromJson(Map<String, dynamic> json) {
    ownerName = json['owner_name'];
    shopName = json['shop_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    businessType = json['business_type'];
    language = json['language'];
    address = json['address'];
    businessIndustry = json['business_industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner_name'] = ownerName;
    data['shop_name'] = shopName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['business_type'] = businessType;
    data['language'] = language;
    data['address'] = address;
    data['business_industry'] = businessIndustry;
    return data;
  }
}
