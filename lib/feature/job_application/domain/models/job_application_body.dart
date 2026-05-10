class JobApplicationBody {
  String? jobIdentityNumber;
  String? title;
  String? slug;
  String? description;
  String? responsibilities;
  String? benefits;
  int? companyId;
  int? jobCategoryId;
  int? jobSubCategoryId;
  int? countryId;
  int? stateId;
  int? cityId;
  String? address;
  double? latitude;
  double? longitude;
  int? salaryFrom;
  int? salaryTo;
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
  String? externalApplyLink;
  String? status;
  bool? isFeatured;
  bool? isUrgent;
  bool? isHighlighted;
  String? metaTitle;
  String? metaDescription;
  int? createdBy;
  List<int>? benefitsIds;
  List<int>? tagIds;
  List<SkillData>? skillData;
  List<ScreeningQuestions>? screeningQuestions;
  String? sMethod;

  JobApplicationBody(
      {this.jobIdentityNumber,
        this.title,
        this.slug,
        this.description,
        this.responsibilities,
        this.benefits,
        this.companyId,
        this.jobCategoryId,
        this.jobSubCategoryId,
        this.countryId,
        this.stateId,
        this.cityId,
        this.address,
        this.latitude,
        this.longitude,
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
        this.externalApplyLink,
        this.status,
        this.isFeatured,
        this.isUrgent,
        this.isHighlighted,
        this.metaTitle,
        this.metaDescription,
        this.createdBy,
        this.benefitsIds,
        this.tagIds,
        this.skillData,
        this.screeningQuestions,
        this.sMethod
      });

  JobApplicationBody.fromJson(Map<String, dynamic> json) {
    jobIdentityNumber = json['job_identity_number'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    responsibilities = json['responsibilities'];
    benefits = json['benefits'];
    companyId = json['company_id'];
    jobCategoryId = json['job_category_id'];
    jobSubCategoryId = json['job_sub_category_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
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
    externalApplyLink = json['external_apply_link'];
    status = json['status'];
    isFeatured = json['is_featured'];
    isUrgent = json['is_urgent'];
    isHighlighted = json['is_highlighted'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    createdBy = json['created_by'];
    benefitsIds = json['benefits_ids'].cast<int>();
    tagIds = json['tag_ids'].cast<int>();
    if (json['skill_data'] != null) {
      skillData = <SkillData>[];
      json['skill_data'].forEach((v) {
        skillData!.add(SkillData.fromJson(v));
      });
    }
    if (json['screening_questions'] != null) {
      screeningQuestions = <ScreeningQuestions>[];
      json['screening_questions'].forEach((v) {
        screeningQuestions!.add(new ScreeningQuestions.fromJson(v));
      });
    }
    sMethod = json['sMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_identity_number'] = jobIdentityNumber;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['responsibilities'] = responsibilities;
    data['benefits'] = benefits;
    data['company_id'] = companyId;
    data['job_category_id'] = jobCategoryId;
    data['job_sub_category_id'] = jobSubCategoryId;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
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
    data['external_apply_link'] = externalApplyLink;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    data['is_urgent'] = isUrgent;
    data['is_highlighted'] = isHighlighted;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['created_by'] = createdBy;
    data['benefits_ids'] = benefitsIds;
    data['tag_ids'] = tagIds;
    if (skillData != null) {
      data['skill_data'] = skillData!.map((v) => v.toJson()).toList();
    }
    if (screeningQuestions != null) {
      data['screening_questions'] =
          screeningQuestions!.map((v) => v.toJson()).toList();
    }
    data['sMethod'] = sMethod;
    return data;
  }
}

class SkillData {
  int? skillId;
  int? experienceYears;
  bool? isMandatory;

  SkillData({this.skillId, this.experienceYears, this.isMandatory});

  SkillData.fromJson(Map<String, dynamic> json) {
    skillId = json['skill_id'];
    experienceYears = json['experience_years'];
    isMandatory = json['is_mandatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skill_id'] = skillId;
    data['experience_years'] = experienceYears;
    data['is_mandatory'] = isMandatory;
    return data;
  }
}

class ScreeningQuestions {
  String? question;
  String? type;
  bool? isRequired;
  int? sortOrder;
  List<Options>? options;

  ScreeningQuestions(
      {this.question,
        this.type,
        this.isRequired,
        this.sortOrder,
        this.options});

  ScreeningQuestions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    type = json['type'];
    isRequired = json['is_required'];
    sortOrder = json['sort_order'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['type'] = type;
    data['is_required'] = isRequired;
    data['sort_order'] = sortOrder;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? optionText;
  int? sortOrder;

  Options({this.optionText, this.sortOrder});

  Options.fromJson(Map<String, dynamic> json) {
    optionText = json['option_text'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['option_text'] = optionText;
    data['sort_order'] = sortOrder;
    return data;
  }
}
