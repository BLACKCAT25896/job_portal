

class ExploreItem {
  int? id;
  int? instituteId;
  String? title;
  String? description;
  String? image;
  int? status;
  String? createdAt;

  ExploreItem(
      {this.id,
        this.instituteId,
        this.title,
        this.description,
        this.image,
        this.status,
        this.createdAt});

  ExploreItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteId = json['institute_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_id'] = instituteId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

