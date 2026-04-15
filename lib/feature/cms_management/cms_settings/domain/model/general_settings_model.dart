import 'package:mighty_job/helper/price_converter.dart';

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
  String? mighty_jobName;
  String? siteTitle;
  String? phone;
  String? email;
  String? language;
  String? googleMap;
  String? address;
  String? onGoogleMap;
  String? currencySymbol;
  String? logo;
  String? mailType;
  String? disabledWebsite;
  String? copyrightText;
  String? facebookLink;
  String? googlePlusLink;
  String? youtubeLink;
  String? whatsAppLink;
  String? twitterLink;
  String? headerNotice;
  String? appVersion;
  String? appUrl;
  String? tagline;
  String? favicon;
  String? themeColor;
  String? backgroundImage;
  String? taxType;
  double? taxPercentage;
  double? serviceCharge;
  String? defaultCurrency;
  String? billingPrefix;
  String? invoiceFooter;
  String? enableKitchenPrint;
  String? enableCustomerCopy;
  String? enableOnlineOrder;
  double? deliveryCharge;
  double? minimumOrderAmount;
  String? autoAcceptOrder;
  double? estimatedPreparationTime;
  String? slackWebhookUrl;
  String? telegramBotToken;
  String? telegramChatId;
  String? twilioSmsEnabled;
  String? emailNotifications;
  String? whatsappNotifications;
  String? autoBackup;
  String? reportTimezone;
  int? dataRetentionDays;
  String? sidebarCollapsed;
  String? darkMode;
  String? defaultDashboard;
  String? razorpayKey;
  String? razorpaySecret;
  String? stripeKey;
  String? stripeSecret;
  String? cashOnDelivery;
  int? maxTableCapacity;
  String? defaultShiftStart;
  String? defaultShiftEnd;
  int? autoLogoutIdleMinutes;
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
  int? isOnline;
  double? latitude;
  double? longitude;
  double? deliveryRadiusKm;
  double? deliveryFee;
  int? deliveryPartnerCount;
  double? deliveryTimeAvg;
  int? pickupEnabled;
  String? openingTime;
  String? closingTime;
  int? autoAcceptOrders;
  int? preOrderEnabled;
  int? maxOrderCapacity;
  double? avgRating;
  int? reviewCount;
  int? totalOrders;
  String? lastOrderTime;
  String? lastActiveTime;
  int? loyaltyPointsEnabled;
  int? offersEnabled;
  SocialMediaLinks? socialMediaLinks;
  int? whatsappChatEnable;


  SettingItem(
      {this.mighty_jobName,
        this.siteTitle,
        this.phone,
        this.email,
        this.language,
        this.googleMap,
        this.address,
        this.onGoogleMap,
        this.currencySymbol,
        this.logo,
        this.mailType,
        this.disabledWebsite,
        this.copyrightText,
        this.facebookLink,
        this.googlePlusLink,
        this.youtubeLink,
        this.whatsAppLink,
        this.twitterLink,
        this.headerNotice,
        this.appVersion,
        this.appUrl,
        this.tagline,
        this.favicon,
        this.themeColor,
        this.backgroundImage,
        this.taxType,
        this.taxPercentage,
        this.serviceCharge,
        this.defaultCurrency,
        this.billingPrefix,
        this.invoiceFooter,
        this.enableKitchenPrint,
        this.enableCustomerCopy,
        this.enableOnlineOrder,
        this.deliveryCharge,
        this.minimumOrderAmount,
        this.autoAcceptOrder,
        this.estimatedPreparationTime,
        this.slackWebhookUrl,
        this.telegramBotToken,
        this.telegramChatId,
        this.twilioSmsEnabled,
        this.emailNotifications,
        this.whatsappNotifications,
        this.autoBackup,
        this.reportTimezone,
        this.dataRetentionDays,
        this.sidebarCollapsed,
        this.darkMode,
        this.defaultDashboard,
        this.razorpayKey,
        this.razorpaySecret,
        this.stripeKey,
        this.stripeSecret,
        this.cashOnDelivery,
        this.maxTableCapacity,
        this.defaultShiftStart,
        this.defaultShiftEnd,
        this.autoLogoutIdleMinutes,
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
        this.isOnline,
        this.latitude,
        this.longitude,
        this.deliveryRadiusKm,
        this.deliveryFee,
        this.deliveryPartnerCount,
        this.deliveryTimeAvg,
        this.pickupEnabled,
        this.openingTime,
        this.closingTime,
        this.autoAcceptOrders,
        this.preOrderEnabled,
        this.maxOrderCapacity,
        this.avgRating,
        this.reviewCount,
        this.totalOrders,
        this.lastOrderTime,
        this.lastActiveTime,
        this.loyaltyPointsEnabled,
        this.offersEnabled,
        this.socialMediaLinks,
        this.whatsappChatEnable
      });

  SettingItem.fromJson(Map<String, dynamic> json) {
    mighty_jobName = json['mighty_job_name'];
    siteTitle = json['site_title'];
    phone = json['phone'].toString();
    email = json['email'];
    language = json['language'];
    googleMap = json['google_map'].toString();
    address = json['address'];
    onGoogleMap = json['on_google_map'].toString();
    currencySymbol = json['currency_symbol'];
    logo = json['logo'];
    mailType = json['mail_type'].toString();
    disabledWebsite = json['disabled_website'].toString();
    copyrightText = json['copyright_text'];
    facebookLink = json['facebook_link'];
    googlePlusLink = json['google_plus_link'];
    youtubeLink = json['youtube_link'];
    whatsAppLink = json['whatsapp_chat_url'].toString();
    twitterLink = json['twitter_link'];
    headerNotice = json['header_notice'];
    appVersion = json['app_version'].toString();
    appUrl = json['app_url'];
    tagline = json['tagline'];
    favicon = json['favicon'];
    themeColor = json['theme_color'];
    backgroundImage = json['background_image'];
    taxType = json['tax_type'];
    taxPercentage = PriceConverter.parseAmount(json['tax_percentage']);
    serviceCharge = PriceConverter.parseAmount(json['service_charge']);
    defaultCurrency = json['default_currency'];
    billingPrefix = json['billing_prefix'];
    invoiceFooter = json['invoice_footer'];
    enableKitchenPrint = json['enable_kitchen_print'].toString();
    enableCustomerCopy = json['enable_customer_copy'].toString();
    enableOnlineOrder = json['enable_online_order'].toString();
    deliveryCharge = PriceConverter.parseAmount(json['delivery_charge']);
    minimumOrderAmount = PriceConverter.parseAmount(json['minimum_order_amount']);
    autoAcceptOrder = json['auto_accept_order'].toString();
    estimatedPreparationTime = PriceConverter.parseAmount(json['estimated_preparation_time']);
    slackWebhookUrl = json['slack_webhook_url'];
    telegramBotToken = json['telegram_bot_token'];
    telegramChatId = json['telegram_chat_id'];
    twilioSmsEnabled = json['twilio_sms_enabled'];
    emailNotifications = json['email_notifications'];
    whatsappNotifications = json['whatsapp_notifications'].toString();
    autoBackup = json['auto_backup'].toString();
    reportTimezone = json['report_timezone'];
    dataRetentionDays = PriceConverter.parseInt(json['data_retention_days']);
    sidebarCollapsed = json['sidebar_collapsed'].toString();
    darkMode = json['dark_mode'].toString();
    defaultDashboard = json['default_dashboard'].toString();
    razorpayKey = json['razorpay_key'];
    razorpaySecret = json['razorpay_secret'];
    stripeKey = json['stripe_key'];
    stripeSecret = json['stripe_secret'];
    cashOnDelivery = json['cash_on_delivery'].toString();
    maxTableCapacity = PriceConverter.parseInt(json['max_table_capacity']);
    defaultShiftStart = json['default_shift_start'];
    defaultShiftEnd = json['default_shift_end'];
    autoLogoutIdleMinutes = PriceConverter.parseInt( json['auto_logout_idle_minutes']);
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
    isOnline = PriceConverter.parseInt(json['is_online']);
    latitude = PriceConverter.parseAmount(json['latitude']);
    longitude = PriceConverter.parseAmount(json['longitude']);
    deliveryRadiusKm = PriceConverter.parseAmount(json['delivery_radius_km']);
    deliveryFee = PriceConverter.parseAmount(json['delivery_fee']);
    deliveryPartnerCount = PriceConverter.parseInt(json['delivery_partner_count']);
    deliveryTimeAvg = PriceConverter.parseAmount(json['delivery_time_avg']);
    pickupEnabled = PriceConverter.parseInt(json['pickup_enabled']);
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    autoAcceptOrders = PriceConverter.parseInt(json['auto_accept_orders']);
    preOrderEnabled = PriceConverter.parseInt(json['pre_order_enabled']);
    maxOrderCapacity = PriceConverter.parseInt(json['max_order_capacity']);
    avgRating = PriceConverter.parseAmount(json['avg_rating']);
    reviewCount = PriceConverter.parseInt(json['review_count']);
    totalOrders = PriceConverter.parseInt(json['total_orders']);
    lastOrderTime = json['last_order_time'];
    lastActiveTime = json['last_active_time'];
    loyaltyPointsEnabled = PriceConverter.parseInt(json['loyalty_points_enabled']);
    offersEnabled = PriceConverter.parseInt(json['offers_enabled']);
    // socialMediaLinks = json['social_media_links'] != null
    //     ? SocialMediaLinks.fromJson(json['social_media_links'])
    //     : null;
    whatsappChatEnable = PriceConverter.parseInt(json['whatsapp_chat_enable']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mighty_job_name'] = mighty_jobName;
    data['site_title'] = siteTitle;
    data['phone'] = phone;
    data['email'] = email;
    data['language'] = language;
    data['google_map'] = googleMap;
    data['address'] = address;
    data['on_google_map'] = onGoogleMap;
    data['currency_symbol'] = currencySymbol;
    data['logo'] = logo;
    data['mail_type'] = mailType;
    data['disabled_website'] = disabledWebsite;
    data['copyright_text'] = copyrightText;
    data['facebook_link'] = facebookLink;
    data['google_plus_link'] = googlePlusLink;
    data['youtube_link'] = youtubeLink;
    data['whatsapp_chat_url'] = whatsAppLink;
    data['twitter_link'] = twitterLink;
    data['header_notice'] = headerNotice;
    data['app_version'] = appVersion;
    data['app_url'] = appUrl;
    data['tagline'] = tagline;
    data['favicon'] = favicon;
    data['theme_color'] = themeColor;
    data['background_image'] = backgroundImage;
    data['tax_type'] = taxType;
    data['tax_percentage'] = taxPercentage;
    data['service_charge'] = serviceCharge;
    data['default_currency'] = defaultCurrency;
    data['billing_prefix'] = billingPrefix;
    data['invoice_footer'] = invoiceFooter;
    data['enable_kitchen_print'] = enableKitchenPrint;
    data['enable_customer_copy'] = enableCustomerCopy;
    data['enable_online_order'] = enableOnlineOrder;
    data['delivery_charge'] = deliveryCharge;
    data['minimum_order_amount'] = minimumOrderAmount;
    data['auto_accept_order'] = autoAcceptOrder;
    data['estimated_preparation_time'] = estimatedPreparationTime;
    data['slack_webhook_url'] = slackWebhookUrl;
    data['telegram_bot_token'] = telegramBotToken;
    data['telegram_chat_id'] = telegramChatId;
    data['twilio_sms_enabled'] = twilioSmsEnabled;
    data['email_notifications'] = emailNotifications;
    data['whatsapp_notifications'] = whatsappNotifications;
    data['auto_backup'] = autoBackup;
    data['report_timezone'] = reportTimezone;
    data['data_retention_days'] = dataRetentionDays;
    data['sidebar_collapsed'] = sidebarCollapsed;
    data['dark_mode'] = darkMode;
    data['default_dashboard'] = defaultDashboard;
    data['razorpay_key'] = razorpayKey;
    data['razorpay_secret'] = razorpaySecret;
    data['stripe_key'] = stripeKey;
    data['stripe_secret'] = stripeSecret;
    data['cash_on_delivery'] = cashOnDelivery;
    data['max_table_capacity'] = maxTableCapacity;
    data['default_shift_start'] = defaultShiftStart;
    data['default_shift_end'] = defaultShiftEnd;
    data['auto_logout_idle_minutes'] = autoLogoutIdleMinutes;
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
    data['is_online'] = isOnline;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['delivery_radius_km'] = deliveryRadiusKm;
    data['delivery_fee'] = deliveryFee;
    data['delivery_partner_count'] = deliveryPartnerCount;
    data['delivery_time_avg'] = deliveryTimeAvg;
    data['pickup_enabled'] = pickupEnabled;
    data['opening_time'] = openingTime;
    data['closing_time'] = closingTime;
    data['auto_accept_orders'] = autoAcceptOrders;
    data['pre_order_enabled'] = preOrderEnabled;
    data['max_order_capacity'] = maxOrderCapacity;
    data['avg_rating'] = avgRating;
    data['review_count'] = reviewCount;
    data['total_orders'] = totalOrders;
    data['last_order_time'] = lastOrderTime;
    data['last_active_time'] = lastActiveTime;
    data['loyalty_points_enabled'] = loyaltyPointsEnabled;
    data['offers_enabled'] = offersEnabled;
    if (socialMediaLinks != null) {
      data['social_media_links'] = socialMediaLinks!.toJson();
    }
    data['whatsapp_chat_enable'] = whatsappChatEnable;

    return data;
  }
}

class SocialMediaLinks {
  String? facebook;
  String? instagram;
  String? twitter;
  String? linkedin;

  SocialMediaLinks(
      {this.facebook, this.instagram, this.twitter, this.linkedin});

  SocialMediaLinks.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['twitter'] = twitter;
    data['linkedin'] = linkedin;
    return data;
  }
}
