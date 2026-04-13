
class CategoryBody {
  String? name;
  int? isFeatured;
  int? isHot;
  String? image;
  int? parentId;
  int? isOffer;
  String? startDate;
  String? endDate;
  int? status;
  String? method;

  CategoryBody(
      {this.name,
        this.isFeatured,
        this.isHot,
        this.image,
        this.parentId,
        this.isOffer,
        this.startDate,
        this.endDate,
        this.status,
        this.method
        });

  CategoryBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isFeatured = json['is_featured'];
    isHot = json['is_hot'];
    image = json['image'];
    parentId = json['parent_id'];
    isOffer = json['is_offer'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (isFeatured != null) data['is_featured'] = isFeatured;
    if (isHot != null) data['is_hot'] = isHot;
    if (image != null) data['image'] = image;
    if (parentId != null) data['parent_id'] = parentId;
    if (isOffer != null) data['is_offer'] = isOffer;
    if (startDate != null) data['start_date'] = startDate;
    if (endDate != null) data['end_date'] = endDate;
    if (status != null) data['status'] = status;
    if (method != null) data['_method'] = method;

    return data;
  }

}