
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';

class AuctionItem {
  int? id;
  int? shopId;
  int? productItemId;
  int? productVariantId;
  double? startPrice;
  double? reservePrice;
  double? bidIncrement;
  String? startTime;
  String? endTime;
  String? status;
  BidSummary? bidSummary;
  Product? product;
  Variants? variant;
  List<Bids>? bids;

  AuctionItem(
      {this.id,
        this.shopId,
        this.productItemId,
        this.productVariantId,
        this.startPrice,
        this.reservePrice,
        this.bidIncrement,
        this.startTime,
        this.endTime,
        this.status,
        this.bidSummary,
        this.product,
        this.variant,
        this.bids});

  AuctionItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    productItemId = json['product_item_id'];
    productVariantId = json['product_variant_id'];
    startPrice = PriceConverter.parseAmount(json['start_price']);
    reservePrice = PriceConverter.parseAmount(json['reserve_price']);
    bidIncrement = PriceConverter.parseAmount(json['bid_increment']);
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
    bidSummary = json['bid_summary'] != null
        ? BidSummary.fromJson(json['bid_summary'])
        : null;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    variant =
    json['variant'] != null ? Variants.fromJson(json['variant']) : null;
    if (json['bids'] != null) {
      bids = <Bids>[];
      json['bids'].forEach((v) {
        bids!.add(Bids.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shop_id'] = shopId;
    data['product_item_id'] = productItemId;
    data['product_variant_id'] = productVariantId;
    data['start_price'] = startPrice;
    data['reserve_price'] = reservePrice;
    data['bid_increment'] = bidIncrement;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['status'] = status;
    if (bidSummary != null) {
      data['bid_summary'] = bidSummary!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (variant != null) {
      data['variant'] = variant!.toJson();
    }
    if (bids != null) {
      data['bids'] = bids!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BidSummary {
  int? totalBids;
  double? highestBid;
  double? latestBid;

  BidSummary({this.totalBids, this.highestBid, this.latestBid});

  BidSummary.fromJson(Map<String, dynamic> json) {
    totalBids = PriceConverter.parseInt(json['total_bids']);
    highestBid = PriceConverter.parseAmount(json['highest_bid']);
    latestBid = PriceConverter.parseAmount(json['latest_bid']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_bids'] = totalBids;
    data['highest_bid'] = highestBid;
    data['latest_bid'] = latestBid;
    return data;
  }
}



class Bids {
  int? id;
  int? shopId;
  int? auctionItemId;
  int? userId;
  double? bidAmount;
  User? user;

  Bids(
      {this.id,
        this.shopId,
        this.auctionItemId,
        this.userId,
        this.bidAmount,
        this.user});

  Bids.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    auctionItemId = json['auction_item_id'];
    userId = json['user_id'];
    bidAmount = PriceConverter.parseAmount(json['bid_amount']);
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shop_id'] = shopId;
    data['auction_item_id'] = auctionItemId;
    data['user_id'] = userId;
    data['bid_amount'] = bidAmount;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;

  User({this.id, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
