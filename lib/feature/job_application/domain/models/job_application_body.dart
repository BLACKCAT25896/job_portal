class JobApplicationBody {
  int? jobListingId;
  int? candidateId;
  int? resumeId;
  int? jobStageId;
  int? expectedSalary;
  String? notes;
  String? status;
  String? appliedAt;
  String? sMethod;

  JobApplicationBody(
      {this.jobListingId,
        this.candidateId,
        this.resumeId,
        this.jobStageId,
        this.expectedSalary,
        this.notes,
        this.status,
        this.appliedAt,
        this.sMethod});

  JobApplicationBody.fromJson(Map<String, dynamic> json) {
    jobListingId = json['job_listing_id'];
    candidateId = json['candidate_id'];
    resumeId = json['resume_id'];
    jobStageId = json['job_stage_id'];
    expectedSalary = json['expected_salary'];
    notes = json['notes'];
    status = json['status'];
    appliedAt = json['applied_at'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_listing_id'] = jobListingId;
    data['candidate_id'] = candidateId;
    data['resume_id'] = resumeId;
    data['job_stage_id'] = jobStageId;
    data['expected_salary'] = expectedSalary;
    data['notes'] = notes;
    data['status'] = status;
    data['applied_at'] = appliedAt;
    data['_method'] = sMethod;
    return data;
  }
}
