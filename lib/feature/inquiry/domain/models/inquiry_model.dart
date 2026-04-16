
class InquiryItem {
  int? id;
  String? name;
  String? email;
  String? phoneNo;
  String? subject;
  String? message;
  int? isRead;
  int? isReplied;
  String? type;

  InquiryItem(
      {this.id,
        this.name,
        this.email,
        this.phoneNo,
        this.subject,
        this.message,
        this.isRead,
        this.isReplied,
        this.type,
        });

  InquiryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    subject = json['subject'];
    message = json['message'];
    isRead = json['is_read'];
    isReplied = json['is_replied'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_no'] = phoneNo;
    data['subject'] = subject;
    data['message'] = message;
    data['is_read'] = isRead;
    data['is_replied'] = isReplied;
    data['type'] = type;

    return data;
  }
}
