class CandidateEducationBody {
  int? degreeLevelId;
  String? degreeTitle;
  String? major;
  String? board;
  String? institute;
  bool? isForeignInstitute;
  String? result;
  int? passingYear;
  int? durationYears;
  String? achievement;
  bool? isVerified;
  int? status;
  String? sMethod;

  CandidateEducationBody(
      {this.degreeLevelId,
        this.degreeTitle,
        this.major,
        this.board,
        this.institute,
        this.isForeignInstitute,
        this.result,
        this.passingYear,
        this.durationYears,
        this.achievement,
        this.isVerified,
        this.status,
        this.sMethod});

  CandidateEducationBody.fromJson(Map<String, dynamic> json) {
    degreeLevelId = json['degree_level_id'];
    degreeTitle = json['degree_title'];
    major = json['major'];
    board = json['board'];
    institute = json['institute'];
    isForeignInstitute = json['is_foreign_institute'];
    result = json['result'];
    passingYear = json['passing_year'];
    durationYears = json['duration_years'];
    achievement = json['achievement'];
    isVerified = json['is_verified'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['degree_level_id'] = degreeLevelId;
    data['degree_title'] = degreeTitle;
    data['major'] = major;
    data['board'] = board;
    data['institute'] = institute;
    data['is_foreign_institute'] = isForeignInstitute;
    data['result'] = result;
    data['passing_year'] = passingYear;
    data['duration_years'] = durationYears;
    data['achievement'] = achievement;
    data['is_verified'] = isVerified;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
