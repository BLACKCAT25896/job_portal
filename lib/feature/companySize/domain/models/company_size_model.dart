
class CompanySizeItem {
  int? id;
  String? name;
  String? slug;
  int? minSize;
  int? maxSize;
  int? status;
  int? sortOrder;

  CompanySizeItem(
      {this.id,
        this.name,
        this.slug,
        this.minSize,
        this.maxSize,
        this.status,
        this.sortOrder,
      });

  CompanySizeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    minSize = json['min_size'];
    maxSize = json['max_size'];
    status = json['status'];
    sortOrder = json['sort_order'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['min_size'] = minSize;
    data['max_size'] = maxSize;
    data['status'] = status;
    data['sort_order'] = sortOrder;
    return data;
  }
}

