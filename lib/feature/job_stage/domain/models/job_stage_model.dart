

import 'package:mighty_job/helper/price_converter.dart';

class JobStageItem {
  int? id;
  String? name;
  String? description;
  int? companyId;
  int? status;

  JobStageItem(
      {this.id,
        this.name,
        this.description,
        this.companyId,
        this.status,
       });

  JobStageItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    description = json['description'];
    companyId = PriceConverter.parseInt(json['company_id']);
    status = PriceConverter.parseInt(json['status']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['company_id'] = companyId;
    data['status'] = status;
    return data;
  }
}

