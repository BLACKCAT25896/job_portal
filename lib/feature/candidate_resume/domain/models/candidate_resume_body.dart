class CandidateResumeBody {
  String? title;
  String? type;
  int? isDefault;
  int? status;
  String? sMethod;

  CandidateResumeBody(
      {
        this.title,
        this.type,
        this.isDefault,
        this.status,
        this.sMethod});

  CandidateResumeBody.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    type = json['type'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['title'] = title??'';
    data['type'] = type??'uploaded';
    data['is_default'] = "1";
    data['status'] = "1";
    data['_method'] = sMethod??'post';
    return data;
  }
}
