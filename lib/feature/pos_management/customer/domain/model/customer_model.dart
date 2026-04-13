
import 'package:ecommerce/helper/price_converter.dart';

class CustomerItem {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? createdAt;
  String? avatar;

  CustomerItem(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.createdAt,
        this.avatar,
      });

  CustomerItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['created_at'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['avatar'] = avatar;
    return data;
  }
}
