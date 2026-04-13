class LocalCustomer{
  String? name;
  String? phone;
  String? partyType;

  LocalCustomer({this.name, this.phone, this.partyType});

  LocalCustomer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    partyType = json['party_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['party_type'] = partyType;
    return data;
  }
}