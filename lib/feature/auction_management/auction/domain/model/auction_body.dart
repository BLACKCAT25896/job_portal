class AuctionBody {
  int? productItemId;
  int? productVariantId;
  String? startPrice;
  String? reservePrice;
  String? bidIncrement;
  String? startTime;
  String? endTime;
  String? status;

  AuctionBody(
      {this.productItemId,
        this.productVariantId,
        this.startPrice,
        this.reservePrice,
        this.bidIncrement,
        this.startTime,
        this.endTime,
        this.status});

  AuctionBody.fromJson(Map<String, dynamic> json) {
    productItemId = json['product_item_id'];
    productVariantId = json['product_variant_id'];
    startPrice = json['start_price'];
    reservePrice = json['reserve_price'];
    bidIncrement = json['bid_increment'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_item_id'] = productItemId;
    data['product_variant_id'] = productVariantId;
    data['start_price'] = startPrice;
    data['reserve_price'] = reservePrice;
    data['bid_increment'] = bidIncrement;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['status'] = status;
    return data;
  }
}
