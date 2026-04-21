

import 'package:mighty_job/helper/price_converter.dart';

class JobListingItem {
  int? id;
  String? jobIdentityNumber;
  String? jobTitle;
  String? description;
  int? salaryFrom;
  int? salaryTo;
  int? position;
  String? jobExpiryDate;
  int? experience;
  int? hideSalary;
  int? isFreelance;
  int? isSuspended;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? companyId;
  String? companyName;
  int? jobCategoryId;
  String? jobCategoryName;
  int? careerLevelId;
  String? careerLevelName;
  int? degreeLevelId;
  String? degreeLevelName;
  int? currencyId;
  String? currencyCode;
  String? currencyIcon;
  int? salaryPeriodId;
  String? salaryPeriod;
  String? countryName;
  String? stateName;
  String? cityName;
  Company? company;
  Category? category;

  JobListingItem(
      {this.id,
        this.jobIdentityNumber,
        this.jobTitle,
        this.description,
        this.salaryFrom,
        this.salaryTo,
        this.position,
        this.jobExpiryDate,
        this.experience,
        this.hideSalary,
        this.isFreelance,
        this.isSuspended,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.companyId,
        this.companyName,
        this.jobCategoryId,
        this.jobCategoryName,
        this.careerLevelId,
        this.careerLevelName,
        this.degreeLevelId,
        this.degreeLevelName,
        this.currencyId,
        this.currencyCode,
        this.currencyIcon,
        this.salaryPeriodId,
        this.salaryPeriod,
        this.countryName,
        this.stateName,
        this.cityName,
        this.company,
        this.category
      });

  JobListingItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobIdentityNumber = json['job_identity_number'];
    jobTitle = json['job_title'];
    description = json['description'];
    salaryFrom = PriceConverter.parseInt(json['salary_from']);
    salaryTo = PriceConverter.parseInt(json['salary_to']);
    position = PriceConverter.parseInt(json['position']);
    jobExpiryDate = json['job_expiry_date'];
    experience = PriceConverter.parseInt(json['experience']);
    hideSalary = PriceConverter.parseInt(json['hide_salary']);
    isFreelance = PriceConverter.parseInt(json['is_freelance']);
    isSuspended = PriceConverter.parseInt(json['is_suspended']);
    status = PriceConverter.parseInt(json['status']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyId = PriceConverter.parseInt(json['company_id']);
    companyName = json['company_name'];
    jobCategoryId = PriceConverter.parseInt(json['job_category_id']);
    jobCategoryName = json['job_category_name'];
    careerLevelId = PriceConverter.parseInt(json['career_level_id']);
    careerLevelName = json['career_level_name'];
    degreeLevelId = PriceConverter.parseInt(json['degree_level_id']);
    degreeLevelName = json['degree_level_name'];
    currencyId = PriceConverter.parseInt(json['currency_id']);
    currencyCode = json['currency_code'];
    currencyIcon = json['currency_icon'];
    salaryPeriodId = PriceConverter.parseInt(json['salary_period_id']);
    salaryPeriod = json['salary_period'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_identity_number'] = jobIdentityNumber;
    data['job_title'] = jobTitle;
    data['description'] = description;
    data['salary_from'] = salaryFrom;
    data['salary_to'] = salaryTo;
    data['position'] = position;
    data['job_expiry_date'] = jobExpiryDate;
    data['experience'] = experience;
    data['hide_salary'] = hideSalary;
    data['is_freelance'] = isFreelance;
    data['is_suspended'] = isSuspended;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['company_id'] = companyId;
    data['company_name'] = companyName;
    data['job_category_id'] = jobCategoryId;
    data['job_category_name'] = jobCategoryName;
    data['career_level_id'] = careerLevelId;
    data['career_level_name'] = careerLevelName;
    data['degree_level_id'] = degreeLevelId;
    data['degree_level_name'] = degreeLevelName;
    data['currency_id'] = currencyId;
    data['currency_code'] = currencyCode;
    data['currency_icon'] = currencyIcon;
    data['salary_period_id'] = salaryPeriodId;
    data['salary_period'] = salaryPeriod;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? slug;
  String? logo;
  String? establishedIn;
  String? details;
  String? website;
  String? location;

  Company(
      {this.id,
        this.name,
        this.slug,
        this.logo,
        this.establishedIn,
        this.details,
        this.website,
        this.location,
        });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    logo = json['logo'];
    establishedIn = json['established_in'];
    details = json['details'];
    website = json['website'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['logo'] = logo;
    data['established_in'] = establishedIn;
    data['details'] = details;
    data['website'] = website;
    data['location'] = location;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? slug;

  Category(
      {this.id,
        this.name,
        this.description,
        this.slug,
       });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['slug'] = slug;
    return data;
  }
}


