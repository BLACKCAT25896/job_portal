import 'package:ecommerce/helper/price_converter.dart';

class WarehouseBody {
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? latitude;
  String? longitude;
  String? managerName;
  int? capacity;
  int? isDefault;
  String? status;

  WarehouseBody(
      {this.name,
        this.slug,
        this.email,
        this.phone,
        this.address,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.managerName,
        this.capacity,
        this.isDefault,
        this.status});

  WarehouseBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    managerName = json['manager_name'];
    capacity = PriceConverter.parseInt(json['capacity']);
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['manager_name'] = managerName;
    data['capacity'] = capacity;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}
