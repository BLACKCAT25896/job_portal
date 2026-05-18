

import 'package:job/feature/company/domain/models/company_model.dart';
import 'package:job/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:job/feature/job_category/domain/models/job_category_model.dart';
import 'package:job/helper/price_converter.dart';

class JobListingItem {
  int? id;
  String? jobIdentityNumber;
  String? title;
  String? slug;
  String? description;
  String? responsibilities;
  List<Benefits>? benefits;
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
  List<Tags>? tags;
  List<Skills>? skills;
  List<ScreeningQuestions>? screeningQuestions;


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
        this.tags,
        this.skills,
        this.screeningQuestions
       });

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
    jobCategoryId = PriceConverter.parseInt(json['job_category_id']);
    address = json['address'];
    salaryFrom = PriceConverter.parseAmount(json['salary_from']);
    salaryTo = PriceConverter.parseAmount(json['salary_to']);
    currencyId = PriceConverter.parseInt(json['currency_id']);
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
    shortlistedCount = PriceConverter.parseInt(json['shortlisted_count']);
    rejectedCount = PriceConverter.parseInt(json['rejected_count']);
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

    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
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

class Benefits {
  int? id;
  String? name;

  Benefits(
      {this.id,
        this.name,
        });

  Benefits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Skills {
  int? id;
  String? name;
  String? description;

  Skills({this.id,
    this.name,
    this.description});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class ScreeningQuestions {
  int? id;
  int? jobListingId;
  String? question;
  String? type;
  List<Options>? options;

  ScreeningQuestions(
      {this.id,
        this.jobListingId,
        this.question,
        this.type,
        this.options});

  ScreeningQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobListingId = json['job_listing_id'];
    question = json['question'];
    type = json['type'];
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
        this.optionText,});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobScreeningQuestionId = json['job_screening_question_id'];
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

class Tags {
  int? id;
  String? name;

  Tags(
      {this.id,
        this.name,
       });

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}

