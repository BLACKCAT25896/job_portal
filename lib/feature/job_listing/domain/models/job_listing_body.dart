class JobListingBody {
  String? jobIdentityNumber;
  String? jobTitle;
  String? description;
  int? salaryFrom;
  int? salaryTo;
  int? currencyId;
  int? salaryPeriodId;
  int? companyId;
  int? jobCategoryId;
  int? careerLevelId;
  int? degreeLevelId;
  int? position;
  String? jobExpiryDate;
  bool? hideSalary;
  bool? isFreelance;
  bool? status;
  int? experience;
  String? sMethod;

  JobListingBody(
      {this.jobIdentityNumber,
        this.jobTitle,
        this.description,
        this.salaryFrom,
        this.salaryTo,
        this.currencyId,
        this.salaryPeriodId,
        this.companyId,
        this.jobCategoryId,
        this.careerLevelId,
        this.degreeLevelId,
        this.position,
        this.jobExpiryDate,
        this.hideSalary,
        this.isFreelance,
        this.status,
        this.experience,
        this.sMethod
      });

  JobListingBody.fromJson(Map<String, dynamic> json) {
    jobIdentityNumber = json['job_identity_number'];
    jobTitle = json['job_title'];
    description = json['description'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    currencyId = json['currency_id'];
    salaryPeriodId = json['salary_period_id'];
    companyId = json['company_id'];
    jobCategoryId = json['job_category_id'];
    careerLevelId = json['career_level_id'];
    degreeLevelId = json['degree_level_id'];
    position = json['position'];
    jobExpiryDate = json['job_expiry_date'];
    hideSalary = json['hide_salary'];
    isFreelance = json['is_freelance'];
    status = json['status'];
    experience = json['experience'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_identity_number'] = jobIdentityNumber;
    data['job_title'] = jobTitle;
    data['description'] = description;
    data['salary_from'] = salaryFrom;
    data['salary_to'] = salaryTo;
    data['currency_id'] = currencyId;
    data['salary_period_id'] = salaryPeriodId;
    data['company_id'] = companyId;
    data['job_category_id'] = jobCategoryId;
    data['career_level_id'] = careerLevelId;
    data['degree_level_id'] = degreeLevelId;
    data['position'] = position;
    data['job_expiry_date'] = jobExpiryDate;
    data['hide_salary'] = hideSalary;
    data['is_freelance'] = isFreelance;
    data['status'] = status;
    data['experience'] = experience;
    data['_method'] = sMethod;
    return data;
  }
}
