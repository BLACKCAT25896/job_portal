import 'package:ecommerce/helper/price_converter.dart';

class PermissionModel {
  bool? success;
  String? message;
  List<PermissionItem>? data;


  PermissionModel({this.success, this.message, this.data, });

  PermissionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PermissionItem>[];
      json['data'].forEach((v) {
        data!.add(PermissionItem.fromJson(v));
      });
    }

  }

}


class PermissionItem {
  int? id;
  String? name;
  bool? isSelected;

  PermissionItem({this.id, this.name,  this.isSelected});

  PermissionItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

