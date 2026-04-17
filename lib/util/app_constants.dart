import 'dart:convert';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:mighty_job/helper/domain_helper/domain_helper.dart';
import 'package:mighty_job/localization/language_model.dart';
import 'package:mighty_job/util/images.dart';
import 'package:url_launcher/url_launcher.dart';


class AppConstants {
  static const String version = '1.0.0'; //Flutter version 3.24.3
  static const int versionCode = 1;
  static const String whatsUpdate = "Fixing Price related problems for sales and purchase";
  static const String appName = 'Mighty mighty_job';
  static const bool demo = true;

  //local
  static const String baseUrl = 'https://job-portal.bdboibazer.com';
  static const String imageBaseUrl = '$baseUrl/storage';
  static const String versionPath = '/api/v1';
  static String get domain => DomainHelper.getCurrentDomain();

  static const String loginUri = '/login';
  static const String registration = '/onboardings';
  static const String profile = '/profile';
  static const String galleries = '/galleries';
  static const String tokenUri = '/save-fcm-token';
  static const String vapidKey = 'BGvbfIkEn80a8STCbBPdr-S8QNtjrZfrs-UH7-sZgDDpr_LDfxCsx4n-pC-kUh2jqpWLwEvoAti0AyFYLcvQhng';



  //Here is
  static const String industries = '/industries';
  static const String transactions = '/transactions';
  static const String companySizes = '/company-sizes';
  static const String companies = '/companies';
  static const String favoriteCompanies = '/favorite-companies';
  static const String ownerShipTypes = '/owner-ship-types';
  static const String careerLevels = '/career-levels';
  static const String degreeLevels = '/degree-levels';
  static const String salaryCurrencies = '/salary-currencies';
  static const String salaryPeriods = '/salary-periods';
  static const String skills = '/skills';
  static const String jobCategories = '/job-categories';
  static const String postCategories = '/post-categories';
  static const String posts = '/posts';
  static const String favoriteJobs = '/favorite-jobs';
  static const String jobListings = '/job-listings';
  static const String jobStages = '/job-stages';
  static const String jobApplications = '/job-applications';
  static const String candidateEducation = '/candidate-education';
  static const String candidateExperience = '/candidate-experiences';
  static const String candidateResume = '/candidate-resumes';
  static const String reportedJobs = '/reported-jobs';
  static const String inquiries = '/inquiries';
  static const String dashboardStatistics = '/dashboard/statistics';


  //Frontend
  static const String frontendIndustries = '/frontend/industries';
  static const String frontendCompanies = '/frontend/companies';
  static const String frontendSkills = '/frontend/skills';
  static const String frontendJobCategories = '/frontend/job-categories';
  static const String frontendJobListings = '/frontend/job-listings';
  static const String frontendPostCategories = '/frontend/post-categories';
  static const String frontendPost = '/frontend/posts';
  static const String frontendContactUs = '/frontend/contact-us';
  static const String frontendPrivacyPolicy = '/frontend/privacy-policy';
  static const String frontendTermsCondition = '/frontend/terms-conditions';
  static const String frontendCookiePolicy = '/frontend/cookie-policy';
  static const String frontendAboutUs = '/frontend/about-us';



  //cms Controll
  static const String banner = '/banners';
  static const String aboutUs = '/about-us';
  static const String explore = '/explores';
  static const String whyChooseUs = '/why-choose-us';
  static const String faqs = '/faqs';
  static const String feedback = '/testimonials';
  static const String academicImages = '/academic-images';
  static const String policies = '/policies';
  static const String generalSetting = '/tenant-settings';
  static const String generalSettingUpdate = '/tenant-settings-update';
  static const String publicSetting = '/publicSetting';
  static const String frontendCmsSection = '/frontend/cms-sections';
  static const String cmsSectionReorder = '/cms-sections-update';
  static const String imageSetting = '/tenant-image-settings';


  //mighty_job management
  static const String purchase = '/purchases';
  static const String supplier = '/suppliers';
  static const String purchaseReturn = '/purchase-return';
  static const String orders = '/orders';
  static const String orderStatus = '/order-statuses';
  static const String orderType = '/order-types';
  static const String customers = '/customers';
  static const String paymentMethods = '/payment-methods';
  static const String unit = '/units';
  static const String warehouses = '/warehouses';
  static const String tax = '/tax-settings';
  static const String globalStatusUpdate = '/global-status-update';


  //Inventory
  static const String brand = '/brands';
  static const String categories = '/categories';
  static const String subCategory = '/product-categories';
  static const String products = '/product-items';
  static const String quotation = '/quotation';
  static const String posOrder = '/quotation';
  static const String stock = '/quotation';
  static const String uint = '/uint';
  static const String damage = '/product-damage';
  static const String attribute = '/attributes';
  static const String attributeValue = '/attribute-values';

  //reports
  static const String dashboardReport = '/dashboard-data';
  static const String stockReport = '/reports/stocks';
  static const String purchaseReport = '/reports/purchases';
  static const String purchaseEstimateReport = '/reports/purchase-estimate';
  static const String openingStockReport = '/reports/opening-stock';

  //Hrm module
  static const String department = '/departments';
  static const String designations = '/designations';
  static const String salaryTypes = '/salary-types';
  static const String employees = '/employees';
  static const String employeeAttendance = '/attendances';
  static const String employeeSalary = '/employee-salaries';
  static const String salarySetup = '/salary-setups';
  static const String salaryGenerate = '/salary-generates';
  static const String leaveTypes = '/leave-types';
  static const String leaveApplications = '/leave-applications';
  static const String weeklyHolidays = '/weekly-holidays';
  static const String loans = '/loans';
  static const String loanInstallments = '/loan-installments';
  static const String awards = '/awards';
  static const String recruitments = '/recruitments';
  static const String candidates = '/candidates';
  static const String interviews = '/interviews';




  //customer
  static const String customerLogin = '/customer-login';
  static const String customerOtpVerify = '/customer-otp-verify';
  static const String customerResentOtp = '/customer-otp-sent';
  static const String customerProfile = '/customer/profile';
  static const String customerUpdateProfile = '/customer/update';
  static const String customerUpdateProfileAvatar = '/customer/profile-update';

  static const String roles = '/roles';
  static const String permissionList = '/permissions-list';
  static const String user = '/users';


  //loyalty
  static const String loyaltyPoint = '/loyalty-points';
  static const String loyaltyPointRedemption = '/loyalty-redemptions';


  //setting
  static const String storageUnLink = '/system/unlink-storage';
  static const String storageLink = '/system/link-storage';
  static const String clearCache = '/system/clear-cache';



  //accounts
  static const String accounts = '/accounts';
  static const String depositCategory = '/deposit-categories';
  static const String deposit = '/deposits';
  static const String expensesCategory = '/expense-categories';
  static const String expenses = '/expenses';
  static const String fund = '/funds';
  static const String tip = '/tips';
  static const String tipDistribution = '/tip-distributions';


  //sms
  static const String smsTemplate = '/sms-template';
  static const String phoneBookCategory = '/phone-book-category';
  static const String phoneBook = '/phone-book';
  static const String smsPurchase = '/sms-purchase';
  static const String userListForSms = '/api/sms-get-users';
  static const String sendSms = '/sms-send';
  static const String smsReport = '/send-sms-report';

  //Support Ticket
  static const String supportTicketCategory = '/support-ticket-categories';
  static const String supportTicket = '/support-tickets';
  static const String supportTicketFaq = '/support-ticket-faqs';
  static const String myTicket = '/my-tickets';
  static const String ticketReply = '/ticket-reply';
  static const String closeTicket = '/admin/close-ticket';



  //Theme
  static const String getTheme = '/frontend/themes';
  static const String themeAssign = '/tenants-theme';
  static const String getDefaultTheme = '/frontend/default-theme';


  static const String auction = '/auction-items';



  // Shared Key
  static const String theme = 'theme';
  static const String token = 'token';
  static const String useType = 'userId';
  static const String deviceToken = 'deviceToken';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cartList = 'cart_list';
  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String searchAddress = 'search_address';
  static const String localization = 'X-Localization';
  static const String topic = 'mighty';
  static const String zoneId = 'zoneId';
  static const String skipOnboard = 'skip-onboard';
  static const String bluetoothMacAddress = 'bluetooth_mac_address';
  static const String lastShownDateKey = 'lastShownDate';



  static const String demoModeMessage = 'This Feature is restricted in demo mode.';




  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.unitedKingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.bangladesh, languageName: 'Bengali', countryCode: 'BD', languageCode: 'bn'),
  ];

  static const int limitOfPickedIdentityImageNumber = 2;
  static const double limitOfPickedImageSizeInMB = 2;
  static const double completionArea = 500;


  static String formatedDate = "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";

  static bool getDemo() {
    bool demo = false;
    assert(demo = true);
    return demo;
  }
  static final facebookAppEvents = FacebookAppEvents();
  static final phoneNumberFormat = FilteringTextInputFormatter.digitsOnly;
  static final numberFormat = FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  static void pixel (String title){
    facebookAppEvents.logEvent(
      name: title,
      parameters: {
        'button_id': title,
      },
    );
    AppConstants.facebookAppEvents.setAdvertiserTracking(enabled: true);
  }

  static Future<void> onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw 'Could not launch ${link.url}';
    }
  }

  static Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  static Future<void> sendEmail(String emailAddress, {String subject = '', String body = ''}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  static bool isValidJson(String source) {
    try {
      final decoded = jsonDecode(source);
      return decoded is List;
    } catch (_) {
      return false;
    }
  }

  static EdgeInsetsDirectional directionalOnly({double start = 0, double end = 0}) {
    return EdgeInsetsDirectional.only(start: start, end: end);
  }

  static double toDouble(String? value) {
    if (value == null || value.trim().isEmpty) return 0;
    return double.tryParse(value.trim()) ?? 0;
  }


  static Color parseHexColor(dynamic color, {Color fallback = const Color(0xFF6750A4)}) {
    if (color == null) return fallback;
    try {
      if (color is Color) {
        return color;
      } else if (color is int) {
        return Color(color);
      } else if (color is String) {
        String value = color.toUpperCase().trim();
        if (value.startsWith('#')) value = value.substring(1);
        if (value.startsWith('0X')) value = value.substring(2);
        if (value.length == 6) value = 'FF$value';
        return Color(int.parse(value, radix: 16));
      } else {
        return fallback;
      }
    } catch (e) {
      return fallback;
    }
  }
}
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

}
