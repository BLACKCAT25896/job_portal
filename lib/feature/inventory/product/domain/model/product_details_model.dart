import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/helper/price_converter.dart';

class ProductDetailsModel {
  bool? status;
  String? message;
  Product? data;

  ProductDetailsModel({this.status, this.message, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Product.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}



class ReviewSummary {
  int? totalReviews;
  double? averageRating;

  ReviewSummary({this.totalReviews, this.averageRating});

  ReviewSummary.fromJson(Map<String, dynamic> json) {
    totalReviews = PriceConverter.parseInt(json['total_reviews']);
    averageRating = PriceConverter.parseAmount(json['average_rating']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    return data;
  }
}


