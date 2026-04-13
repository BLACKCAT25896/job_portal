class CustomerBody {
  String? name;
  String? email;
  String? phone;
  String? address;
  int? status;
  String? sMethod;

  CustomerBody({this.name, this.email, this.phone, this.address, this.status, this.sMethod});
  CustomerBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
