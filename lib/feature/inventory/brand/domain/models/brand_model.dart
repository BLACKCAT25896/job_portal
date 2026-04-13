class BrandModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  BrandModel(
      {this.success, this.statusCode, this.message, this.data});

  BrandModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? currentPage;
  List<BrandItem>? data;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <BrandItem>[];
      json['data'].forEach((v) {
        data!.add(BrandItem.fromJson(v));
      });
    }

    total = json['total'];
  }

}

class BrandItem {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  BrandItem(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
        });

  BrandItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }
  //toJson
Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['logo'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
}
}
