class JobApplicationBody {
  int? jobListingId;
  int? resumeId;
  int? jobStageId;
  int? expectedSalary;
  String? notes;
  String? status;

  JobApplicationBody(
      {this.jobListingId,
        this.resumeId,
        this.jobStageId,
        this.expectedSalary,
        this.notes,
        this.status});

  JobApplicationBody.fromJson(Map<String, dynamic> json) {
    jobListingId = json['job_listing_id'];
    resumeId = json['resume_id'];
    jobStageId = json['job_stage_id'];
    expectedSalary = json['expected_salary'];
    notes = json['notes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_listing_id'] = jobListingId;
    data['resume_id'] = resumeId;
    data['job_stage_id'] = jobStageId;
    data['expected_salary'] = expectedSalary;
    data['notes'] = notes;
    data['status'] = status;
    return data;
  }
}
