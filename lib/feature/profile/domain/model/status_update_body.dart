class StatusUpdateBody {
  int? id;
  String? type;
  String? status;

  StatusUpdateBody({this.id, this.type, this.status});

  StatusUpdateBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}
