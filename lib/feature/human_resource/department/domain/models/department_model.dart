

class DepartmentItem {
  String? id;
  String? name;
  String? description;
  String? status;

  DepartmentItem(
      {this.id,
        this.name,
        this.description,
        this.status,});

  DepartmentItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    description = json['description'];
    status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}