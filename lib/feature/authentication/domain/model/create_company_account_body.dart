class CreateCompanyAccountBody {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  String? companyName;
  int? industryId;
  int? ownerShipTypeId;
  int? companySizeId;
  String? establishedIn;
  String? ceo;
  String? address;
  String? details;
  String? website;
  String? businessTradeLicenseNo;
  String? rlNo;
  String? contactPersonName;
  String? contactPersonDesignation;
  String? contactPersonEmail;
  String? contactPersonMobile;
  bool? disabilitySupport;

  CreateCompanyAccountBody(
      {this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.phone,
        this.password,
        this.passwordConfirmation,
        this.companyName,
        this.industryId,
        this.ownerShipTypeId,
        this.companySizeId,
        this.establishedIn,
        this.ceo,
        this.address,
        this.details,
        this.website,
        this.businessTradeLicenseNo,
        this.rlNo,
        this.contactPersonName,
        this.contactPersonDesignation,
        this.contactPersonEmail,
        this.contactPersonMobile,
        this.disabilitySupport,
        });

  CreateCompanyAccountBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    companyName = json['company_name'];
    industryId = json['industry_id'];
    ownerShipTypeId = json['owner_ship_type_id'];
    companySizeId = json['company_size_id'];
    establishedIn = json['established_in'];
    ceo = json['ceo'];
    address = json['address'];
    details = json['details'];
    website = json['website'];
    businessTradeLicenseNo = json['business_trade_license_no'];
    rlNo = json['rl_no'];
    contactPersonName = json['contact_person_name'];
    contactPersonDesignation = json['contact_person_designation'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonMobile = json['contact_person_mobile'];
    disabilitySupport = json['disability_support'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['company_name'] = companyName;
    data['industry_id'] = industryId;
    data['owner_ship_type_id'] = ownerShipTypeId;
    data['company_size_id'] = companySizeId;
    data['established_in'] = establishedIn;
    data['ceo'] = ceo;
    data['address'] = address;
    data['details'] = details;
    data['website'] = website;
    data['business_trade_license_no'] = businessTradeLicenseNo;
    data['rl_no'] = rlNo;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_designation'] = contactPersonDesignation;
    data['contact_person_email'] = contactPersonEmail;
    data['contact_person_mobile'] = contactPersonMobile;
    data['disability_support'] = disabilitySupport;
    return data;
  }
}
