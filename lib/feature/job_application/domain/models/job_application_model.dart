

import 'package:mighty_job/helper/price_converter.dart';

class JobApplicationItem {
  int? id;
  int? jobListingId;
  int? candidateId;
  int? resumeId;
  int? jobStageId;
  String? expectedSalary;
  String? notes;
  String? status;
  String? appliedAt;
  String? createdAt;
  JobListing? jobListing;
  Candidate? candidate;
  Resume? resume;
  JobStage? jobStage;
  List<Schedules>? schedules;

  JobApplicationItem(
      {this.id,
        this.jobListingId,
        this.candidateId,
        this.resumeId,
        this.jobStageId,
        this.expectedSalary,
        this.notes,
        this.status,
        this.appliedAt,
        this.createdAt,
        this.jobListing,
        this.candidate,
        this.resume,
        this.jobStage,
        this.schedules});

  JobApplicationItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobListingId = PriceConverter.parseInt(json['job_listing_id']);
    candidateId = PriceConverter.parseInt(json['candidate_id']);
    resumeId = PriceConverter.parseInt(json['resume_id']);
    jobStageId = PriceConverter.parseInt(json['job_stage_id']);
    expectedSalary = json['expected_salary'];
    notes = json['notes'];
    status = json['status'];
    appliedAt = json['applied_at'];
    createdAt = json['created_at'];
    jobListing = json['job_listing'] != null
        ? JobListing.fromJson(json['job_listing'])
        : null;
    candidate = json['candidate'] != null
        ? Candidate.fromJson(json['candidate'])
        : null;
    resume =
    json['resume'] != null ? Resume.fromJson(json['resume']) : null;
    jobStage = json['job_stage'] != null
        ? JobStage.fromJson(json['job_stage'])
        : null;
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_listing_id'] = jobListingId;
    data['candidate_id'] = candidateId;
    data['resume_id'] = resumeId;
    data['job_stage_id'] = jobStageId;
    data['expected_salary'] = expectedSalary;
    data['notes'] = notes;
    data['status'] = status;
    data['applied_at'] = appliedAt;
    data['created_at'] = createdAt;
    if (jobListing != null) {
      data['job_listing'] = jobListing!.toJson();
    }
    if (candidate != null) {
      data['candidate'] = candidate!.toJson();
    }
    if (resume != null) {
      data['resume'] = resume!.toJson();
    }
    if (jobStage != null) {
      data['job_stage'] = jobStage!.toJson();
    }
    if (schedules != null) {
      data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobListing {
  int? id;
  String? jobTitle;

  JobListing({this.id, this.jobTitle});

  JobListing.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_title'] = jobTitle;
    return data;
  }
}

class Candidate {
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

  Candidate(
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
        this.user});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    userId = PriceConverter.parseInt(json['user_id']);
    uniqueId = json['unique_id'];
    fatherName = json['father_name'];
    nationality = json['nationality'];
    nationalIdCard = json['national_id_card'];
    experience = PriceConverter.parseInt(json['experience']);
    careerLevelId = PriceConverter.parseInt(json['career_level_id']);
    industryId = PriceConverter.parseInt(json['industry_id']);
    currentSalary = json['current_salary'];
    expectedSalary = json['expected_salary'];
    salaryCurrencyId = PriceConverter.parseInt(json['salary_currency_id']);
    address = json['address'];
    immediateAvailable = json['immediate_available'];
    availableAt = json['available_at'];
    jobAlert = json['job_alert'];
    lastProfileUpdate = json['last_profile_update'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;

  User({this.id, this.firstName, this.lastName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    return data;
  }
}

class Resume {
  int? id;
  String? fileName;
  String? filePath;

  Resume({this.id, this.fileName, this.filePath});

  Resume.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    fileName = json['file_name'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    return data;
  }
}

class JobStage {
  int? id;
  String? name;

  JobStage({this.id, this.name});

  JobStage.fromJson(Map<String, dynamic> json) {
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

class Schedules {
  int? id;
  int? jobApplicationId;
  int? jobStageId;
  String? scheduledAt;
  String? location;
  int? batch;
  String? notes;
  String? candidateRejectReason;
  String? employerCancelReason;


  Schedules(
      {this.id,
        this.jobApplicationId,
        this.jobStageId,
        this.scheduledAt,
        this.location,
        this.batch,
        this.notes,
        this.candidateRejectReason,
        this.employerCancelReason,
        });

  Schedules.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    jobApplicationId = PriceConverter.parseInt(json['job_application_id']);
    jobStageId = PriceConverter.parseInt(json['job_stage_id']);
    scheduledAt = json['scheduled_at'];
    location = json['location'];
    batch = PriceConverter.parseInt(json['batch']);
    notes = json['notes'];
    candidateRejectReason = json['candidate_reject_reason'];
    employerCancelReason = json['employer_cancel_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_application_id'] = jobApplicationId;
    data['job_stage_id'] = jobStageId;
    data['scheduled_at'] = scheduledAt;
    data['location'] = location;
    data['batch'] = batch;
    data['notes'] = notes;
    data['candidate_reject_reason'] = candidateRejectReason;
    data['employer_cancel_reason'] = employerCancelReason;
    return data;
  }
}

