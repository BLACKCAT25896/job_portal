class LoyaltyPointRedemptionBody {
  String? name;
  String? parentId;
  String? isOffer;
  String? startDate;
  String? endDate;
  String? status;
  String? sMethod;


  LoyaltyPointRedemptionBody(
      {this.name,
        this.parentId,
        this.isOffer,
        this.startDate,
        this.endDate,
        this.status,
        this.sMethod});

  LoyaltyPointRedemptionBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    parentId = json['parent_id'];
    isOffer = json['is_offer'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    if (name != null) data['name'] = name!;
    if (parentId != null) data['parent_id'] = parentId.toString();
    if (isOffer != null) data['is_offer'] = isOffer.toString();
    if (startDate != null) data['start_date'] = startDate!;
    if (endDate != null) data['end_date'] = endDate!;
    if (status != null) data['status'] = status.toString();
    if (sMethod != null) data['_method'] = sMethod .toString();

    return data;
  }

}
