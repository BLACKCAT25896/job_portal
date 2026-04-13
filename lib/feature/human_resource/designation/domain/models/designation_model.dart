
class DesignationItem {
  String? id;
  String? departmentName;
  String? title;
  String? description;
  String? status;

  DesignationItem(
      {this.id,
        this.departmentName,
        this.title,
        this.description,
        this.status,});

  DesignationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    departmentName = json['department_name'];
    title = json['title'];
    description = json['description'];
    status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['department_name'] = departmentName;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}

