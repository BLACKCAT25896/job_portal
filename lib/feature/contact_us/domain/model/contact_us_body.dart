class ContactUsBody {
  String? email;
  String? name;
  String? phone;
  String? message;

  ContactUsBody({this.email, this.name, this.phone, this.message});

  ContactUsBody.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['message'] = message;
    return data;
  }
}
