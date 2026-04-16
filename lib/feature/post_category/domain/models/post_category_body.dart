class PostCategoryBody {
  String? name;
  String? slug;
  String? description;
  bool? isDefault;
  bool? status;
  String? sMethod;

  PostCategoryBody(
      {this.name,
        this.slug,
        this.description,
        this.isDefault,
        this.status,
        this.sMethod});

  PostCategoryBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
