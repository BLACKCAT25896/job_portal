

import 'package:mighty_job/helper/price_converter.dart';

class CompanyItem {
  int? id;
  String? name;
  String? slug;
  String? logo;
  String? ceo;
  int? noOfOffices;
  int? userId;
  int? industryId;
  int? ownerShipTypeId;
  int? companySizeId;
  String? establishedIn;
  String? details;
  String? website;
  String? location;
  String? location2;
  int? isFeatured;
  String? fax;
  String? uniqueId;
  int? status;

  CompanyItem(
      {this.id,
        this.name,
        this.slug,
        this.logo,
        this.ceo,
        this.noOfOffices,
        this.userId,
        this.industryId,
        this.ownerShipTypeId,
        this.companySizeId,
        this.establishedIn,
        this.details,
        this.website,
        this.location,
        this.location2,
        this.isFeatured,
        this.fax,
        this.uniqueId,
        this.status});

  CompanyItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    slug = json['slug'];
    logo = json['logo'];
    ceo = json['ceo'];
    noOfOffices = PriceConverter.parseInt(json['no_of_offices']);
    userId = PriceConverter.parseInt(json['user_id']);
    industryId = PriceConverter.parseInt(json['industry_id']);
    ownerShipTypeId = PriceConverter.parseInt(json['owner_ship_type_id']);
    companySizeId = PriceConverter.parseInt(json['company_size_id']);
    establishedIn = json['established_in'];
    details = json['details'];
    website = json['website'];
    location = json['location'];
    location2 = json['location2'];
    isFeatured = json['is_featured'];
    fax = json['fax'];
    uniqueId = json['unique_id'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['logo'] = logo;
    data['ceo'] = ceo;
    data['no_of_offices'] = noOfOffices;
    data['user_id'] = userId;
    data['industry_id'] = industryId;
    data['owner_ship_type_id'] = ownerShipTypeId;
    data['company_size_id'] = companySizeId;
    data['established_in'] = establishedIn;
    data['details'] = details;
    data['website'] = website;
    data['location'] = location;
    data['location2'] = location2;
    data['is_featured'] = isFeatured;
    data['fax'] = fax;
    data['unique_id'] = uniqueId;
    data['status'] = status;
    return data;
  }
}
