class IndustryBody {
  String? name;
  int? status;
  String? method;

  IndustryBody({this.name, this.status, this.method});

  IndustryBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    data['_method'] = method;
    return data;
  }
}
