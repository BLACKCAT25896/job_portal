

class CandidateItem {
  int? id;
  int? userId;
  String? uniqueId;
  String? fatherName;
  String? nationality;
  String? nationalIdCard;
  int? experience;
  int? careerLevelId;
  int? industryId;
  String? currentSalary;
  String? expectedSalary;
  int? salaryCurrencyId;
  String? address;
  bool? immediateAvailable;
  String? availableAt;
  bool? jobAlert;
  String? lastProfileUpdate;
  User? user;
  CareerLevel? careerLevel;
  Industry? industry;
  SalaryCurrency? salaryCurrency;
  List<Educations>? educations;
  List<Experiences>? experiences;
  List<Applications>? applications;
  List<FavoriteJobs>? favoriteJobs;
  List<FavoriteCompanies>? favoriteCompanies;

  CandidateItem(
      {this.id,
        this.userId,
        this.uniqueId,
        this.fatherName,
        this.nationality,
        this.nationalIdCard,
        this.experience,
        this.careerLevelId,
        this.industryId,
        this.currentSalary,
        this.expectedSalary,
        this.salaryCurrencyId,
        this.address,
        this.immediateAvailable,
        this.availableAt,
        this.jobAlert,
        this.lastProfileUpdate,
        this.user,
        this.careerLevel,
        this.industry,
        this.salaryCurrency,
        this.educations,
        this.experiences,
        this.applications,
        this.favoriteJobs,
        this.favoriteCompanies});

  CandidateItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    uniqueId = json['unique_id'];
    fatherName = json['father_name'];
    nationality = json['nationality'];
    nationalIdCard = json['national_id_card'];
    experience = json['experience'];
    careerLevelId = json['career_level_id'];
    industryId = json['industry_id'];
    currentSalary = json['current_salary'];
    expectedSalary = json['expected_salary'];
    salaryCurrencyId = json['salary_currency_id'];
    address = json['address'];
    immediateAvailable = json['immediate_available'];
    availableAt = json['available_at'];
    jobAlert = json['job_alert'];
    lastProfileUpdate = json['last_profile_update'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    careerLevel = json['career_level'] != null
        ? CareerLevel.fromJson(json['career_level'])
        : null;
    industry = json['industry'] != null
        ? Industry.fromJson(json['industry'])
        : null;
    salaryCurrency = json['salary_currency'] != null
        ? SalaryCurrency.fromJson(json['salary_currency'])
        : null;
    if (json['educations'] != null) {
      educations = <Educations>[];
      json['educations'].forEach((v) {
        educations!.add(Educations.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(Experiences.fromJson(v));
      });
    }
    if (json['applications'] != null) {
      applications = <Applications>[];
      json['applications'].forEach((v) {
        applications!.add(Applications.fromJson(v));
      });
    }
    if (json['favorite_jobs'] != null) {
      favoriteJobs = <FavoriteJobs>[];
      json['favorite_jobs'].forEach((v) {
        favoriteJobs!.add(FavoriteJobs.fromJson(v));
      });
    }
    if (json['favorite_companies'] != null) {
      favoriteCompanies = <FavoriteCompanies>[];
      json['favorite_companies'].forEach((v) {
        favoriteCompanies!.add(FavoriteCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['unique_id'] = uniqueId;
    data['father_name'] = fatherName;
    data['nationality'] = nationality;
    data['national_id_card'] = nationalIdCard;
    data['experience'] = experience;
    data['career_level_id'] = careerLevelId;
    data['industry_id'] = industryId;
    data['current_salary'] = currentSalary;
    data['expected_salary'] = expectedSalary;
    data['salary_currency_id'] = salaryCurrencyId;
    data['address'] = address;
    data['immediate_available'] = immediateAvailable;
    data['available_at'] = availableAt;
    data['job_alert'] = jobAlert;
    data['last_profile_update'] = lastProfileUpdate;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (careerLevel != null) {
      data['career_level'] = careerLevel!.toJson();
    }
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (salaryCurrency != null) {
      data['salary_currency'] = salaryCurrency!.toJson();
    }
    if (educations != null) {
      data['educations'] = educations!.map((v) => v.toJson()).toList();
    }
    if (experiences != null) {
      data['experiences'] = experiences!.map((v) => v.toJson()).toList();
    }
    if (applications != null) {
      data['applications'] = applications!.map((v) => v.toJson()).toList();
    }
    if (favoriteJobs != null) {
      data['favorite_jobs'] =
          favoriteJobs!.map((v) => v.toJson()).toList();
    }
    if (favoriteCompanies != null) {
      data['favorite_companies'] =
          favoriteCompanies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    return data;
  }
}

class CareerLevel {
  int? id;
  String? levelName;

  CareerLevel({this.id, this.levelName});

  CareerLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelName = json['level_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level_name'] = levelName;
    return data;
  }
}

class Industry {
  int? id;
  String? name;

  Industry({this.id, this.name});

  Industry.fromJson(Map<String, dynamic> json) {
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

class SalaryCurrency {
  int? id;
  String? currencyName;
  String? currencyCode;

  SalaryCurrency({this.id, this.currencyName, this.currencyCode});

  SalaryCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencyName = json['currency_name'];
    currencyCode = json['currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency_name'] = currencyName;
    data['currency_code'] = currencyCode;
    return data;
  }
}

class Educations {
  int? id;
  int? candidateId;
  String? institute;
  String? degreeTitle;
  int? year;
  String? result;

  Educations(
      {this.id,
        this.candidateId,
        this.institute,
        this.degreeTitle,
        this.year,
        this.result});

  Educations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    institute = json['institute'];
    degreeTitle = json['degree_title'];
    year = json['year'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['institute'] = institute;
    data['degree_title'] = degreeTitle;
    data['year'] = year;
    data['result'] = result;
    return data;
  }
}

class Experiences {
  int? id;
  int? candidateId;
  String? company;
  String? experienceTitle;
  String? startDate;
  String? endDate;
  bool? currentlyWorking;
  String? description;

  Experiences(
      {this.id,
        this.candidateId,
        this.company,
        this.experienceTitle,
        this.startDate,
        this.endDate,
        this.currentlyWorking,
        this.description});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    company = json['company'];
    experienceTitle = json['experience_title'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    currentlyWorking = json['currently_working'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['company'] = company;
    data['experience_title'] = experienceTitle;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['currently_working'] = currentlyWorking;
    data['description'] = description;
    return data;
  }
}

class Applications {
  int? id;
  int? candidateId;
  int? jobListingId;
  int? jobStageId;
  String? status;
  String? appliedAt;
  JobListing? jobListing;
  Industry? jobStage;

  Applications(
      {this.id,
        this.candidateId,
        this.jobListingId,
        this.jobStageId,
        this.status,
        this.appliedAt,
        this.jobListing,
        this.jobStage});

  Applications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    jobListingId = json['job_listing_id'];
    jobStageId = json['job_stage_id'];
    status = json['status'];
    appliedAt = json['applied_at'];
    jobListing = json['job_listing'] != null
        ? JobListing.fromJson(json['job_listing'])
        : null;
    jobStage = json['job_stage'] != null
        ? Industry.fromJson(json['job_stage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['job_listing_id'] = jobListingId;
    data['job_stage_id'] = jobStageId;
    data['status'] = status;
    data['applied_at'] = appliedAt;
    if (jobListing != null) {
      data['job_listing'] = jobListing!.toJson();
    }
    if (jobStage != null) {
      data['job_stage'] = jobStage!.toJson();
    }
    return data;
  }
}

class JobListing {
  int? id;
  String? jobTitle;

  JobListing({this.id, this.jobTitle});

  JobListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_title'] = jobTitle;
    return data;
  }
}

class FavoriteJobs {
  int? id;
  String? jobTitle;
  Pivot? pivot;

  FavoriteJobs({this.id, this.jobTitle, this.pivot});

  FavoriteJobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_title'] = jobTitle;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? candidateId;
  int? jobListingId;

  Pivot({this.candidateId, this.jobListingId});

  Pivot.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidate_id'];
    jobListingId = json['job_listing_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidate_id'] = candidateId;
    data['job_listing_id'] = jobListingId;
    return data;
  }
}

class FavoriteCompanies {
  int? id;
  String? name;
  Pivot? pivot;

  FavoriteCompanies({this.id, this.name, this.pivot});

  FavoriteCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

