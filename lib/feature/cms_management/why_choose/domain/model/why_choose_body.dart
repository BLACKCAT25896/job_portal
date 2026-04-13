class WhyChooseBody {
  String? title;
  String? description;
  String? method;
  WhyChooseBody({this.title, this.description,this.method});

  WhyChooseBody.fromJson(Map<String, String> json) {
    title = json['title'];
    description = json['description'];
    method = json['_method'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['title'] = title??'';
    data['description'] = description??'';
    data['_method'] = method??"POST";
    return data;
  }
}
