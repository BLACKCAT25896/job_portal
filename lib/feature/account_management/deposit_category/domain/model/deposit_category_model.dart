
import 'package:ecommerce/helper/price_converter.dart';

class DepositCategoryItem {
  int? id;
  String? name;
  String? status;
  DepositCategoryItem({this.id, this.name, this.status});
  DepositCategoryItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    status = json['status'].toString();

  }
}




