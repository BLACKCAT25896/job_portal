class DefaultThemeModel {
  bool? status;
  DefaultTheme? defaultTheme;

  DefaultThemeModel({this.status, this.defaultTheme});

  DefaultThemeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    defaultTheme = json['default_theme'] != null
        ? DefaultTheme.fromJson(json['default_theme'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (defaultTheme != null) {
      data['default_theme'] = defaultTheme!.toJson();
    }
    return data;
  }
}

class DefaultTheme {
  int? id;
  String? category;
  String? name;
  String? icon;
  String? description;

  DefaultTheme(
      {this.id,
        this.category,
        this.name,
        this.icon,
        this.description});

  DefaultTheme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['name'] = name;
    data['icon'] = icon;
    data['description'] = description;
    return data;
  }
}
