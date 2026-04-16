class InquiryBody {
  String? name;
  String? email;
  String? phoneNo;
  String? subject;
  String? message;
  String? type;
  String? sMethod;

  InquiryBody(
      {this.name,
        this.email,
        this.phoneNo,
        this.subject,
        this.message,
        this.type,
        this.sMethod});

  InquiryBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    subject = json['subject'];
    message = json['message'];
    type = json['type'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone_no'] = phoneNo;
    data['subject'] = subject;
    data['message'] = message;
    data['type'] = type;
    data['_method'] = sMethod;
    return data;
  }
}
