class JobCategoryBody {
  String? name;
  String? description;
  bool? isFeatured;
  bool? isDefault;
  bool? status;
  String? sMethod;

  JobCategoryBody(
      {this.name,
        this.description,
        this.isFeatured,
        this.isDefault,
        this.status,
        this.sMethod});

  JobCategoryBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    isFeatured = json['is_featured'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['is_featured'] = isFeatured;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
