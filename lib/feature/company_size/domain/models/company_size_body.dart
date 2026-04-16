class CompanySizeBody {
  String? name;
  String? slug;
  String? minSize;
  String? maxSize;
  int? status;
  int? sortOrder;
  String? method;
  CompanySizeBody(
      {this.name,
        this.slug,
        this.minSize,
        this.maxSize,
        this.status,
        this.sortOrder,
        this.method
      });

  CompanySizeBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    minSize = json['min_size'];
    maxSize = json['max_size'];
    status = json['status'];
    sortOrder = json['sort_order'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['min_size'] = minSize;
    data['max_size'] = maxSize;
    data['status'] = status;
    data['sort_order'] = sortOrder;
    data['_method'] = method;
    return data;
  }
}
