class CandidateExperienceBody {
  String? experienceTitle;
  String? companyName;
  String? companyBusiness;
  String? designation;
  String? department;
  String? description;
  String? startDate;
  String? endDate;
  bool? currentlyWorking;
  List<String>? expertiseAreas;
  int? status;
  String? sMethod;

  CandidateExperienceBody(
      {this.experienceTitle,
        this.companyName,
        this.companyBusiness,
        this.designation,
        this.department,
        this.description,
        this.startDate,
        this.endDate,
        this.currentlyWorking,
        this.expertiseAreas,
        this.status,
        this.sMethod});

  CandidateExperienceBody.fromJson(Map<String, dynamic> json) {
    experienceTitle = json['experience_title'];
    companyName = json['company_name'];
    companyBusiness = json['company_business'];
    designation = json['designation'];
    department = json['department'];
    description = json['responsibilities'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    currentlyWorking = json['currently_working'];
    expertiseAreas = json['expertise_areas'].cast<String>();
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['experience_title'] = experienceTitle;
    data['company_name'] = companyName;
    data['company_business'] = companyBusiness;
    data['designation'] = designation;
    data['department'] = department;
    data['responsibilities'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['currently_working'] = currentlyWorking;
    data['expertise_areas'] = expertiseAreas;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
