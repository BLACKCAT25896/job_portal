import 'package:mighty_job/helper/price_converter.dart';

class FrontendPolicyModel {
  bool? status;
  String? message;
  FrontendPolicyItem? data;

  FrontendPolicyModel({this.status, this.message, this.data});

  FrontendPolicyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? FrontendPolicyItem.fromJson(json['data']) : null;
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

class FrontendPolicyItem {
  int? id;
  int? type;
  String? description;

  FrontendPolicyItem({this.id, this.type, this.description});

  FrontendPolicyItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    type = PriceConverter.parseInt(json['type']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['description'] = description;
    return data;
  }
}
