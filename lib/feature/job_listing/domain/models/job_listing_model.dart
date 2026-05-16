

import 'package:job/feature/company/domain/models/company_model.dart';
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
  List<Benefits>? benefits;
  String? address;
  String? latitude;
  String? longitude;
  double? salaryFrom;
  double? salaryTo;
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
  String? createdAt;
  CompanyItem? company;
  JobCategoryItem? category;
  List<SkillItem>? skills;
  List<ScreeningQuestions>? screeningQuestions;

  JobListingItem(
      {this.id,
        this.jobIdentityNumber,
        this.title,
        this.slug,
        this.description,
        this.responsibilities,
        this.benefits,
        this.address,
        this.latitude,
        this.longitude,
        this.salaryFrom,
        this.salaryTo,
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
        this.createdAt,
        this.company,
        this.category,
        this.skills,
        this.screeningQuestions});

  JobListingItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobIdentityNumber = json['job_identity_number'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    responsibilities = json['responsibilities'];
    if (json['benefits'] != null) {
      benefits = <Benefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(Benefits.fromJson(v));
      });
    }
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    salaryPeriodId = PriceConverter.parseInt(json['salary_period_id']);
    hideSalary = json['hide_salary'];
    isNegotiableSalary = json['is_negotiable_salary'];
    employmentType = json['employment_type'];
    workplace = json['workplace'];
    minExperience = PriceConverter.parseInt(json['min_experience']);
    maxExperience = PriceConverter.parseInt(json['max_experience']);
    isFresherAllowed = json['is_fresher_allowed'];
    degreeLevelId = PriceConverter.parseInt(json['degree_level_id']);
    educationDetail = json['education_detail'];
    gender = json['gender'];
    minAge = PriceConverter.parseInt(json['min_age']);
    maxAge = PriceConverter.parseInt(json['max_age']);
    vacancies = PriceConverter.parseInt(json['vacancies']);
    applicationDeadline = json['application_deadline'];
    joiningDate = json['joining_date'];
    applicationType = json['application_type'];
    status = json['status'];
    isFeatured = json['is_featured'];
    isUrgent = json['is_urgent'];
    isHighlighted = json['is_highlighted'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    views = PriceConverter.parseInt(json['views']);
    totalApplications = PriceConverter.parseInt(json['total_applications']);
    createdAt = json['created_at'];
    company = json['company'] != null ? CompanyItem.fromJson(json['company']) : null;
    category = json['category'] != null ? JobCategoryItem.fromJson(json['category']) : null;
    if (json['skills'] != null) {
      skills = <SkillItem>[];
      json['skills'].forEach((v) {
        skills!.add(SkillItem.fromJson(v));
      });
    }
    if (json['screening_questions'] != null) {
      screeningQuestions = <ScreeningQuestions>[];
      json['screening_questions'].forEach((v) {
        screeningQuestions!.add(ScreeningQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_identity_number'] = jobIdentityNumber;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['responsibilities'] = responsibilities;
    if (benefits != null) {
      data['benefits'] = benefits!.map((v) => v.toJson()).toList();
    }
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['salary_from'] = salaryFrom;
    data['salary_to'] = salaryTo;
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
    data['created_at'] = createdAt;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (screeningQuestions != null) {
      data['screening_questions'] =
          screeningQuestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Benefits {
  int? id;
  String? name;

  Benefits({this.id, this.name});

  Benefits.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ScreeningQuestions {
  int? id;
  int? jobListingId;
  String? question;
  String? type;
  int? isRequired;
  List<Options>? options;

  ScreeningQuestions(
      {this.id,
        this.jobListingId,
        this.question,
        this.type,
        this.isRequired,
        this.options});

  ScreeningQuestions.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobListingId = PriceConverter.parseInt(json['job_listing_id']);
    question = json['question'];
    type = json['type'];
    isRequired = PriceConverter.parseInt(json['is_required']);
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_listing_id'] = jobListingId;
    data['question'] = question;
    data['type'] = type;
    data['is_required'] = isRequired;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  int? jobScreeningQuestionId;
  String? optionText;

  Options(
      {this.id,
        this.jobScreeningQuestionId,
        this.optionText,
       });

  Options.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobScreeningQuestionId = PriceConverter.parseInt(json['job_screening_question_id']);
    optionText = json['option_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_screening_question_id'] = jobScreeningQuestionId;
    data['option_text'] = optionText;
    return data;
  }
}


