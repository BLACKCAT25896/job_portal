class SupplierBody {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? sMethod;

  SupplierBody({this.name, this.email, this.phone, this.address, this.sMethod});

  SupplierBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['_method'] = sMethod;
    return data;
  }
}
