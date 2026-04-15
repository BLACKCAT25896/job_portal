class OwnershipTypeBody {
  String? name;
  int? status;
  String? method;

  OwnershipTypeBody({this.name, this.status, this.method});

  OwnershipTypeBody.fromJson(Map<String, dynamic> json) {
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
