class CmsSectionModel {
  bool? status;
  String? message;
  List<SectionItem>? data;

  CmsSectionModel({this.status, this.message, this.data});

  CmsSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SectionItem>[];
      json['data'].forEach((v) {
        data!.add(SectionItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionItem {
  int? id;
  String? name;
  int? serial;
  int? status;

  SectionItem(
      {this.id,
        this.name,
        this.serial,
        this.status,});

  SectionItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serial = json['serial'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['serial'] = serial;
    data['status'] = status;
    return data;
  }
}
