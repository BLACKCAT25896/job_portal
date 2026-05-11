class GeneralSettingModel {
  bool? status;
  String? message;
  SettingItem? data;

  GeneralSettingModel({this.status, this.message, this.data});

  GeneralSettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SettingItem.fromJson(json['data']) : null;
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

class SettingItem {
  String? appName;
  String? appLogo;
  String? appFavicon;
  String? appVersion;
  String? defaultLanguage;
  String? timezone;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? companyAddress;
  String? mailDriver;
  String? mailHost;
  String? mailPort;
  String? mailUsername;
  String? mailPassword;
  String? mailEncryption;
  String? mailFromAddress;
  String? mailFromName;
  String? smsGateway;
  String? twilioSid;
  String? twilioToken;
  String? twilioFrom;
  String? bulkSmsApiKey;
  String? bulkSmsSenderId;
  String? googleClientId;
  String? googleClientSecret;
  String? facebookAppId;
  String? facebookAppSecret;
  String? facebookUrl;
  String? twitterUrl;
  String? linkedinUrl;
  String? youtubeUrl;
  String? currency;
  String? currencySymbol;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  String? maintenanceMode;
  String? registrationEnabled;
  String? jobPostingEnabled;
  String? primaryColor;
  String? secondaryColor;
  String? primaryContainerColor;
  String? darkPrimaryColor;
  String? darkSecondaryColor;
  String? darkContainerColor;
  String? textColor;
  String? darkTextColor;
  String? sidebarSelectedBgColor;
  String? sidebarSelectedTextColor;
  String? contactUsMapLink;
  String? metaAuthor;
  String? ogTitle;
  String? ogDescription;

  SettingItem(
      {this.appName,
        this.appLogo,
        this.appFavicon,
        this.appVersion,
        this.defaultLanguage,
        this.timezone,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.companyAddress,
        this.mailDriver,
        this.mailHost,
        this.mailPort,
        this.mailUsername,
        this.mailPassword,
        this.mailEncryption,
        this.mailFromAddress,
        this.mailFromName,
        this.smsGateway,
        this.twilioSid,
        this.twilioToken,
        this.twilioFrom,
        this.bulkSmsApiKey,
        this.bulkSmsSenderId,
        this.googleClientId,
        this.googleClientSecret,
        this.facebookAppId,
        this.facebookAppSecret,
        this.facebookUrl,
        this.twitterUrl,
        this.linkedinUrl,
        this.youtubeUrl,
        this.currency,
        this.currencySymbol,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.maintenanceMode,
        this.registrationEnabled,
        this.jobPostingEnabled,
        this.primaryColor,
        this.secondaryColor,
        this.primaryContainerColor,
        this.darkPrimaryColor,
        this.darkSecondaryColor,
        this.darkContainerColor,
        this.textColor,
        this.darkTextColor,
        this.sidebarSelectedBgColor,
        this.sidebarSelectedTextColor,
        this.contactUsMapLink,
        this.metaAuthor,
        this.ogTitle,
        this.ogDescription});

  SettingItem.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    appLogo = json['app_logo'];
    appFavicon = json['app_favicon'];
    appVersion = json['app_version'];
    defaultLanguage = json['default_language'];
    timezone = json['timezone'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    companyAddress = json['company_address'];
    mailDriver = json['mail_driver'];
    mailHost = json['mail_host'];
    mailPort = json['mail_port'];
    mailUsername = json['mail_username'];
    mailPassword = json['mail_password'];
    mailEncryption = json['mail_encryption'];
    mailFromAddress = json['mail_from_address'];
    mailFromName = json['mail_from_name'];
    smsGateway = json['sms_gateway'];
    twilioSid = json['twilio_sid'];
    twilioToken = json['twilio_token'];
    twilioFrom = json['twilio_from'];
    bulkSmsApiKey = json['bulk_sms_api_key'];
    bulkSmsSenderId = json['bulk_sms_sender_id'];
    googleClientId = json['google_client_id'];
    googleClientSecret = json['google_client_secret'];
    facebookAppId = json['facebook_app_id'];
    facebookAppSecret = json['facebook_app_secret'];
    facebookUrl = json['facebook_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    youtubeUrl = json['youtube_url'];
    currency = json['currency'];
    currencySymbol = json['currency_symbol'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    maintenanceMode = json['maintenance_mode'];
    registrationEnabled = json['registration_enabled'];
    jobPostingEnabled = json['job_posting_enabled'];
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    primaryContainerColor = json['primary_container_color'];
    darkPrimaryColor = json['dark_primary_color'];
    darkSecondaryColor = json['dark_secondary_color'];
    darkContainerColor = json['dark_container_color'];
    textColor = json['text_color'];
    darkTextColor = json['dark_text_color'];
    sidebarSelectedBgColor = json['sidebar_selected_bg_color'];
    sidebarSelectedTextColor = json['sidebar_selected_text_color'];
    contactUsMapLink = json['contact_us_map_link'];
    metaAuthor = json['meta_author'];
    ogTitle = json['og_title'];
    ogDescription = json['og_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['app_logo'] = appLogo;
    data['app_favicon'] = appFavicon;
    data['app_version'] = appVersion;
    data['default_language'] = defaultLanguage;
    data['timezone'] = timezone;
    data['company_name'] = companyName;
    data['company_email'] = companyEmail;
    data['company_phone'] = companyPhone;
    data['company_address'] = companyAddress;
    data['mail_driver'] = mailDriver;
    data['mail_host'] = mailHost;
    data['mail_port'] = mailPort;
    data['mail_username'] = mailUsername;
    data['mail_password'] = mailPassword;
    data['mail_encryption'] = mailEncryption;
    data['mail_from_address'] = mailFromAddress;
    data['mail_from_name'] = mailFromName;
    data['sms_gateway'] = smsGateway;
    data['twilio_sid'] = twilioSid;
    data['twilio_token'] = twilioToken;
    data['twilio_from'] = twilioFrom;
    data['bulk_sms_api_key'] = bulkSmsApiKey;
    data['bulk_sms_sender_id'] = bulkSmsSenderId;
    data['google_client_id'] = googleClientId;
    data['google_client_secret'] = googleClientSecret;
    data['facebook_app_id'] = facebookAppId;
    data['facebook_app_secret'] = facebookAppSecret;
    data['facebook_url'] = facebookUrl;
    data['twitter_url'] = twitterUrl;
    data['linkedin_url'] = linkedinUrl;
    data['youtube_url'] = youtubeUrl;
    data['currency'] = currency;
    data['currency_symbol'] = currencySymbol;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['maintenance_mode'] = maintenanceMode;
    data['registration_enabled'] = registrationEnabled;
    data['job_posting_enabled'] = jobPostingEnabled;
    data['primary_color'] = primaryColor;
    data['secondary_color'] = secondaryColor;
    data['primary_container_color'] = primaryContainerColor;
    data['dark_primary_color'] = darkPrimaryColor;
    data['dark_secondary_color'] = darkSecondaryColor;
    data['dark_container_color'] = darkContainerColor;
    data['text_color'] = textColor;
    data['dark_text_color'] = darkTextColor;
    data['sidebar_selected_bg_color'] = sidebarSelectedBgColor;
    data['sidebar_selected_text_color'] = sidebarSelectedTextColor;
    data['contact_us_map_link'] = contactUsMapLink;
    data['meta_author'] = metaAuthor;
    data['og_title'] = ogTitle;
    data['og_description'] = ogDescription;
    return data;
  }
}
