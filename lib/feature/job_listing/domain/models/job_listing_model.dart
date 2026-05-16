

import 'package:job/feature/company/domain/models/company_model.dart';
import 'package:job/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:job/feature/job_category/domain/models/job_category_model.dart';
import 'package:job/feature/skill/domain/models/skill_model.dart';
import 'package:job/helper/price_converter.dart';

class JobListingItem {
  int? id;
  String? jobIdentityNumber;
  String? title;
  String? slug;
  String? description;
  String? responsibilities;
  String? benefits;
  int? jobCategoryId;
  String? address;
  double? salaryFrom;
  double? salaryTo;
  int? currencyId;
  int? salaryPeriodId;
  bool? hideSalary;
  bool? isNegotiableSalary;
  String? employmentType;
  String? workplace;
  int? minExperience;
  int? maxExperience;
  bool? isFresherAllowed;
  int? degreeLevelId;
  String? educationDetail;
  String? gender;
  int? minAge;
  int? maxAge;
  int? vacancies;
  String? applicationDeadline;
  String? joiningDate;
  String? applicationType;
  String? status;
  bool? isFeatured;
  bool? isUrgent;
  bool? isHighlighted;
  String? metaTitle;
  String? metaDescription;
  int? views;
  int? totalApplications;
  int? shortlistedCount;
  int? rejectedCount;
  String? createdAt;
  JobCategoryItem? category;
  DegreeLevelItem? degreeLevel;
  CompanyItem? company;


  JobListingItem(
      {this.id,
        this.jobIdentityNumber,
        this.title,
        this.slug,
        this.description,
        this.responsibilities,
        this.benefits,
        this.jobCategoryId,
        this.address,
        this.salaryFrom,
        this.salaryTo,
        this.currencyId,
        this.salaryPeriodId,
        this.hideSalary,
        this.isNegotiableSalary,
        this.employmentType,
        this.workplace,
        this.minExperience,
        this.maxExperience,
        this.isFresherAllowed,
        this.degreeLevelId,
        this.educationDetail,
        this.gender,
        this.minAge,
        this.maxAge,
        this.vacancies,
        this.applicationDeadline,
        this.joiningDate,
        this.applicationType,
        this.status,
        this.isFeatured,
        this.isUrgent,
        this.isHighlighted,
        this.metaTitle,
        this.metaDescription,
        this.views,
        this.totalApplications,
        this.shortlistedCount,
        this.rejectedCount,
        this.createdAt,
        this.category,
        this.degreeLevel,
        this.company,
       });

  JobListingItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobIdentityNumber = json['job_identity_number'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    responsibilities = json['responsibilities'];
    benefits = json['benefits'];
    jobCategoryId = PriceConverter.parseInt(json['job_category_id']);
    address = json['address'];
    salaryFrom = PriceConverter.parseAmount(json['salary_from']);
    salaryTo = PriceConverter.parseAmount(json['salary_to']);
    currencyId = json['currency_id'];
    salaryPeriodId = json['salary_period_id'];
    hideSalary = json['hide_salary'];
    isNegotiableSalary = json['is_negotiable_salary'];
    employmentType = json['employment_type'];
    workplace = json['workplace'];
    minExperience = json['min_experience'];
    maxExperience = json['max_experience'];
    isFresherAllowed = json['is_fresher_allowed'];
    degreeLevelId = json['degree_level_id'];
    educationDetail = json['education_detail'];
    gender = json['gender'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
    vacancies = json['vacancies'];
    applicationDeadline = json['application_deadline'];
    joiningDate = json['joining_date'];
    applicationType = json['application_type'];
    status = json['status'];
    isFeatured = json['is_featured'];
    isUrgent = json['is_urgent'];
    isHighlighted = json['is_highlighted'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    views = json['views'];
    totalApplications = json['total_applications'];
    shortlistedCount = json['shortlisted_count'];
    rejectedCount = json['rejected_count'];
    createdAt = json['created_at'];
    category = json['category'] != null
        ? JobCategoryItem.fromJson(json['category'])
        : null;

    degreeLevel = json['degree_level'] != null
        ? DegreeLevelItem.fromJson(json['degree_level'])
        : null;
    company = json['company'] != null
        ? CompanyItem.fromJson(json['company'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_identity_number'] = jobIdentityNumber;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['responsibilities'] = responsibilities;
    data['benefits'] = benefits;
    data['job_category_id'] = jobCategoryId;
    data['address'] = address;
    data['salary_from'] = salaryFrom;
    data['salary_to'] = salaryTo;
    data['currency_id'] = currencyId;
    data['salary_period_id'] = salaryPeriodId;
    data['hide_salary'] = hideSalary;
    data['is_negotiable_salary'] = isNegotiableSalary;
    data['employment_type'] = employmentType;
    data['workplace'] = workplace;
    data['min_experience'] = minExperience;
    data['max_experience'] = maxExperience;
    data['is_fresher_allowed'] = isFresherAllowed;
    data['degree_level_id'] = degreeLevelId;
    data['education_detail'] = educationDetail;
    data['gender'] = gender;
    data['min_age'] = minAge;
    data['max_age'] = maxAge;
    data['vacancies'] = vacancies;
    data['application_deadline'] = applicationDeadline;
    data['joining_date'] = joiningDate;
    data['application_type'] = applicationType;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    data['is_urgent'] = isUrgent;
    data['is_highlighted'] = isHighlighted;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['views'] = views;
    data['total_applications'] = totalApplications;
    data['shortlisted_count'] = shortlistedCount;
    data['rejected_count'] = rejectedCount;
    data['created_at'] = createdAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }

    if (degreeLevel != null) {
      data['degree_level'] = degreeLevel!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}



