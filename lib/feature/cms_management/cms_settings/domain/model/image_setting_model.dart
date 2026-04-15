class ImageSettingModel {
  bool? status;
  String? message;
  ImageSettingItem? data;

  ImageSettingModel({this.status, this.message, this.data});

  ImageSettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ImageSettingItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ImageSettingItem {
  int? id;
  String? headerLogoLightTheme;
  String? headerLogoDarkTheme;
  String? footerLogoLightTheme;
  String? footerLogoDarkTheme;

  ImageSettingItem(
      {this.id,
        this.headerLogoLightTheme,
        this.headerLogoDarkTheme,
        this.footerLogoLightTheme,
        this.footerLogoDarkTheme,});

  ImageSettingItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headerLogoLightTheme = json['header_logo_light_theme'];
    headerLogoDarkTheme = json['header_logo_dark_theme'];
    footerLogoLightTheme = json['footer_logo_light_theme'];
    footerLogoDarkTheme = json['footer_logo_dark_theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['header_logo_light_theme'] = headerLogoLightTheme;
    data['header_logo_dark_theme'] = headerLogoDarkTheme;
    data['footer_logo_light_theme'] = footerLogoLightTheme;
    data['footer_logo_dark_theme'] = footerLogoDarkTheme;
    return data;
  }
}
