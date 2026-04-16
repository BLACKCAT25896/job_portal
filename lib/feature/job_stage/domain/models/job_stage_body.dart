class JobStageBody {
  String? name;
  String? description;
  int? companyId;
  int? status;
  String? sMethod;

  JobStageBody(
      {this.name, this.description, this.companyId, this.status, this.sMethod});

  JobStageBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    companyId = json['company_id'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['company_id'] = companyId;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
