class SkillBody {
  String? name;
  String? description;
  int? status;
  String? method;

  SkillBody({this.name, this.description, this.status, this.method});

  SkillBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['_method'] = method;
    return data;
  }
}
