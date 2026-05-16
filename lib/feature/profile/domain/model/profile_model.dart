import 'package:job/feature/company_size/domain/models/company_size_model.dart';
import 'package:job/feature/industries/domain/models/industry_model.dart';
import 'package:job/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:job/helper/price_converter.dart';

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
  CompanyInfo? companyInfo;
  CandidateInfo? candidateInfo;
  List<String>? permissions;

  ProfileInfo(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.role,
        this.status,
        this.companyInfo,
        this.candidateInfo,
        this.permissions});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    role = json['role'];
    status = json['status'];
    companyInfo = json['company_info'] != null
        ? CompanyInfo.fromJson(json['company_info'])
        : null;
    candidateInfo = json['candidate_info'] != null
        ? CandidateInfo.fromJson(json['candidate_info'])
        : null;
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
    if (companyInfo != null) {
      data['company_info'] = companyInfo!.toJson();
    }
    if (candidateInfo != null) {
      data['candidate_info'] = candidateInfo!.toJson();
    }
    data['permissions'] = permissions;
    return data;
  }
}

class CompanyInfo {
  int? id;
  int? userId;
  String? name;
  String? logo;
  String? banner;
  String? establishedIn;
  int? industryId;
  int? ownerShipTypeId;
  int? companySizeId;
  String? details;
  String? website;
  String? businessTradeLicenseNo;
  String? rlNo;
  String? ceo;
  String? address;
  String? contactPersonName;
  String? contactPersonDesignation;
  String? contactPersonEmail;
  String? contactPersonMobile;
  bool? disabilitySupport;
  bool? isFeatured;
  int? profileViews;
  IndustryItem? industry;
  OwnershipTypeItem? ownerShipType;
  CompanySizeItem? companySize;

  CompanyInfo(
      {this.id,
        this.userId,
        this.name,
        this.logo,
        this.banner,
        this.establishedIn,
        this.industryId,
        this.ownerShipTypeId,
        this.companySizeId,
        this.details,
        this.website,
        this.businessTradeLicenseNo,
        this.rlNo,
        this.ceo,
        this.address,
        this.contactPersonName,
        this.contactPersonDesignation,
        this.contactPersonEmail,
        this.contactPersonMobile,
        this.disabilitySupport,
        this.isFeatured,
        this.profileViews,
        this.industry,
        this.ownerShipType,
        this.companySize});

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    userId = PriceConverter.parseInt(json['user_id']);
    name = json['name'];
    logo = json['logo'];
    banner = json['banner'];
    establishedIn = json['established_in'].toString();
    industryId = PriceConverter.parseInt(json['industry_id']);
    ownerShipTypeId = PriceConverter.parseInt(json['owner_ship_type_id']);
    companySizeId = PriceConverter.parseInt(json['company_size_id']);
    details = json['details'];
    website = json['website'];
    businessTradeLicenseNo = json['business_trade_license_no'];
    rlNo = json['rl_no'];
    ceo = json['ceo'];
    address = json['address'];
    contactPersonName = json['contact_person_name'];
    contactPersonDesignation = json['contact_person_designation'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonMobile = json['contact_person_mobile'];
    disabilitySupport = json['disability_support'];
    isFeatured = json['is_featured'];
    profileViews = PriceConverter.parseInt(json['profile_views']);
    industry = json['industry'] != null
        ? IndustryItem.fromJson(json['industry'])
        : null;
    ownerShipType = json['owner_ship_type'] != null
        ? OwnershipTypeItem.fromJson(json['owner_ship_type'])
        : null;
    companySize = json['company_size'] != null
        ? CompanySizeItem.fromJson(json['company_size'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['logo'] = logo;
    data['banner'] = banner;
    data['established_in'] = establishedIn;
    data['industry_id'] = industryId;
    data['owner_ship_type_id'] = ownerShipTypeId;
    data['company_size_id'] = companySizeId;
    data['details'] = details;
    data['website'] = website;
    data['business_trade_license_no'] = businessTradeLicenseNo;
    data['rl_no'] = rlNo;
    data['ceo'] = ceo;
    data['address'] = address;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_designation'] = contactPersonDesignation;
    data['contact_person_email'] = contactPersonEmail;
    data['contact_person_mobile'] = contactPersonMobile;
    data['disability_support'] = disabilitySupport;
    data['is_featured'] = isFeatured;
    data['profile_views'] = profileViews;
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (ownerShipType != null) {
      data['owner_ship_type'] = ownerShipType!.toJson();
    }
    if (companySize != null) {
      data['company_size'] = companySize!.toJson();
    }
    return data;
  }
}



class CandidateInfo {
  int? id;
  int? userId;
  String? careerLevelId;
  String? industryId;
  String? salaryCurrencyId;
  String? lookingFor;
  String? availableFor;
  String? fatherName;
  String? motherName;
  String? nationality;
  String? religion;
  String? maritalStatus;
  String? nationalIdCard;
  String? passportNumber;
  String? passportIssueDate;
  String? secondaryMobile;
  String? alternateEmail;
  String? emergencyContact;
  String? bloodGroup;
  String? height;
  String? weight;
  String? careerSummary;
  String? specialQualification;
  String? keywords;
  String? careerObject;
  String? currentSalary;
  String? expectedSalary;
  String? experience;
  String? address;
  String? videoIntro;
  int? profileStrength;
  bool? immediateAvailable;
  String? availableAt;
  bool? jobAlert;

  CandidateInfo(
      {this.id,
        this.userId,
        this.careerLevelId,
        this.industryId,
        this.salaryCurrencyId,
        this.lookingFor,
        this.availableFor,
        this.fatherName,
        this.motherName,
        this.nationality,
        this.religion,
        this.maritalStatus,
        this.nationalIdCard,
        this.passportNumber,
        this.passportIssueDate,
        this.secondaryMobile,
        this.alternateEmail,
        this.emergencyContact,
        this.bloodGroup,
        this.height,
        this.weight,
        this.careerSummary,
        this.specialQualification,
        this.keywords,
        this.careerObject,
        this.currentSalary,
        this.expectedSalary,
        this.experience,
        this.address,
        this.videoIntro,
        this.profileStrength,
        this.immediateAvailable,
        this.availableAt,
        this.jobAlert});

  CandidateInfo.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    userId = PriceConverter.parseInt(json['user_id']);
    careerLevelId = json['career_level_id'];
    industryId = json['industry_id'];
    salaryCurrencyId = json['salary_currency_id'];
    lookingFor = json['looking_for'];
    availableFor = json['available_for'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    nationality = json['nationality'];
    religion = json['religion'];
    maritalStatus = json['marital_status'];
    nationalIdCard = json['national_id_card'];
    passportNumber = json['passport_number'];
    passportIssueDate = json['passport_issue_date'];
    secondaryMobile = json['secondary_mobile'];
    alternateEmail = json['alternate_email'];
    emergencyContact = json['emergency_contact'];
    bloodGroup = json['blood_group'];
    height = json['height'];
    weight = json['weight'];
    careerSummary = json['career_summary'];
    specialQualification = json['special_qualification'];
    keywords = json['keywords'];
    careerObject = json['career_object'];
    currentSalary = json['current_salary'];
    expectedSalary = json['expected_salary'];
    experience = json['experience'];
    address = json['address'];
    videoIntro = json['video_intro'];
    profileStrength = json['profile_strength'];
    immediateAvailable = json['immediate_available'];
    availableAt = json['available_at'];
    jobAlert = json['job_alert'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['career_level_id'] = careerLevelId;
    data['industry_id'] = industryId;
    data['salary_currency_id'] = salaryCurrencyId;
    data['looking_for'] = lookingFor;
    data['available_for'] = availableFor;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['nationality'] = nationality;
    data['religion'] = religion;
    data['marital_status'] = maritalStatus;
    data['national_id_card'] = nationalIdCard;
    data['passport_number'] = passportNumber;
    data['passport_issue_date'] = passportIssueDate;
    data['secondary_mobile'] = secondaryMobile;
    data['alternate_email'] = alternateEmail;
    data['emergency_contact'] = emergencyContact;
    data['blood_group'] = bloodGroup;
    data['height'] = height;
    data['weight'] = weight;
    data['career_summary'] = careerSummary;
    data['special_qualification'] = specialQualification;
    data['keywords'] = keywords;
    data['career_object'] = careerObject;
    data['current_salary'] = currentSalary;
    data['expected_salary'] = expectedSalary;
    data['experience'] = experience;
    data['address'] = address;
    data['video_intro'] = videoIntro;
    data['profile_strength'] = profileStrength;
    data['immediate_available'] = immediateAvailable;
    data['available_at'] = availableAt;
    data['job_alert'] = jobAlert;
    return data;
  }
}
