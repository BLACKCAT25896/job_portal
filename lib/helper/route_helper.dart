

import 'package:mighty_job/feature/candidate/presentation/screens/candidate_screen.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/cms_management/about_us/presentation/screens/about_us_screen.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/screens/system_setting_screen.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/presentation/screens/policy_pages_screen.dart';
import 'package:mighty_job/feature/authentication/presentation/screen/delete_account_screen.dart';
import 'package:mighty_job/feature/authentication/presentation/screen/login_screen.dart';
import 'package:mighty_job/feature/cms_management/banner/presentation/screens/banner_screen.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/screens/explore_screen.dart';
import 'package:mighty_job/feature/cms_management/faq/presentation/screens/faq_screen.dart';
import 'package:mighty_job/feature/cms_management/feedback/presentation/screens/feedback_screen.dart';
import 'package:mighty_job/feature/cms_management/why_choose/presentation/screens/why_choose_us_screen.dart';
import 'package:mighty_job/feature/dashboard/views/dashboard_screen.dart';
import 'package:mighty_job/feature/notification/presentation/screens/notification_screen.dart';
import 'package:mighty_job/feature/payment_method/presentation/screens/payment_method_screen.dart';
import 'package:mighty_job/feature/profile/presentation/screens/profile_screen.dart';
import 'package:mighty_job/feature/role_and_permission/role/presentation/screens/role_screen.dart';
import 'package:mighty_job/feature/role_and_permission/user/presentation/screens/user_screen.dart';
import 'package:mighty_job/feature/setting/presentation/widgets/facebook_setting.dart';
import 'package:mighty_job/feature/setting/presentation/widgets/language_setting.dart';
import 'package:mighty_job/feature/setting/presentation/widgets/system_setting.dart';
import 'package:mighty_job/feature/setting/presentation/widgets/whatsapp_setting.dart';
import 'package:mighty_job/feature/support_ticket/screens/add_ticket_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/support_conversation_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/support_ticket_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/ticket_category_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String home = '/home';
  static const String signIn = '/admin/login';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerify = '/otp-verify';
  static const String resetPassword = '/reset-password';
  static const String dashboard = '/dashboard';
  static const String notification = '/notification';
  static const String profile = '/profile';



  static const String aboutUs = '/about-us';
  static const String banner = '/banner';
  static const String explore = '/explore';
  static const String whyChooseUs = '/conceptual-video';
  static const String faq = '/faq';
  static const String feedback = '/feedback';
  static const String academicImage = '/academic-image';
  static const String policyPages = '/policy-pages';
  static const String websiteSetting = '/website-setting';


  static const String deleteAccount = '/delete-account';
  static const String paymentMethod = '/payment-method';
  static String getPaymentMethodRoute() => paymentMethod;




  //HRM

  static const String candidate = '/candidate';
  static String getCandidateRoute() => candidate;


  static const String roles = '/roles';
  static String getRolesRoute() => roles;
  static const String users = '/users';
  static String getUsersRoute() => users;

  static const String customer = '/customer';
  static String getCustomerRoute() => customer;

  //setting
  static const String whatsappSetting = '/whatsapp-setting';
  static String getWhatsappSettingRoute() => whatsappSetting;
  static const String facebookSetting = '/facebook-setting';
  static String getFacebookSettingRoute() => facebookSetting;
  static const String taxSetting = '/tax-setting';
  static String getTaxSettingRoute() => taxSetting;



  static const String pages = '/pages';
  static String getPagesRoute() => pages;

  //General Setting
  static const String systemSetting = '/system-setting';
  static String getSystemSettingRoute() => systemSetting;
  static const String paymentMethodSetting = '/payment-method-setting';
  static String getPaymentMethodSettingRoute() => paymentMethodSetting;
  static const String customerTypeSetting = '/customer-type-setting';
  static String getCustomerTypeSettingRoute() => customerTypeSetting;


  static const String smsSetting = '/sms-setting';
  static String getSmsSettingRoute() => smsSetting;
  static const String bankSetting = '/bank-setting';
  static String getBankSettingRoute() => bankSetting;
  static const String languageSetting = '/language-setting';
  static String getLanguageSettingRoute() => languageSetting;



  static const String supportTicketCategory = '/support-ticket-category';
  static String getSupportTicketCategoryRoute() => supportTicketCategory;

  static const String supportTicket = '/support-ticket';
  static String getSupportTicketRoute() => supportTicket;

  static const String newTicket = '/new-ticket';
  static String getNewTicketRoute() => newTicket;

  static const String ticketDetail = '/ticket-detail';
  static String getTicketDetailRoute(String id) => "$ticketDetail?id=$id";


  static const String brand = '/brand';
  static String getBrandRoute () => brand;

  static const String addNewBrand = '/add-new-brand';
  static String getAddNewBrandRoute () => addNewBrand;

  static const String category = '/category';
  static String getCategoryRoute () => category;

  static const String addNewCategory = '/add-new-category';
  static String getAddNewCategoryRoute () => addNewCategory;

  static const String subCategory = '/sub-category';
  static String getSubCategoryRoute () => subCategory;

  static const String addNewSubCategory = '/add-new-sub-category';
  static String getAddNewSubCategoryRoute () => addNewSubCategory;



  static String getInitialRoute() => initial;
  static String getSignInRoute() => signIn;
  static String getLoginRoute() => login;
  static String getDashboardRoute() => dashboard;
  static String getProfileRoute() => profile;

  //cms control
  static String getAboutUsRoute() => aboutUs;
  static String getBannerRoute() => banner;
  static String getExploreRoute() => explore;
  static String getWhyChooseUsRoute() => whyChooseUs;
  static String getFaqRoute() => faq;
  static String getFeedbackRoute() => feedback;
  static String getAcademicImageRoute() => academicImage;
  static String getPolicyPagesRoute() => policyPages;
  static String getWebsiteSettingRoute() => websiteSetting;


  static String getDeleteAccountRoute() => deleteAccount;
  static String getNotificationRoute() => notification;



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const LoginScreen()),
    GetPage(name: signIn, page: () => const LoginScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: deleteAccount, page: () => const DeleteAccountScreen()),
    GetPage(name: notification, page: () => const NotificationScreen()),



    //cms
    GetPage(name: whyChooseUs, page: () => const WhyChooseUsScreen()),
    GetPage(name: banner, page: () => const BannerScreen()),
    GetPage(name: aboutUs, page: () => const AboutUsScreen()),
    GetPage(name: explore, page: () => const ExploreScreen()),
    GetPage(name: faq, page: () => const FaqScreen()),
    GetPage(name: feedback, page: () => const FeedbackScreen()),
    GetPage(name: websiteSetting, page: () => const SystemSettingScreen()),


    GetPage(name: paymentMethod, page: () => const PaymentMethodScreen()),
    GetPage(name: roles, page: () => const RoleManagementScreen()),
    GetPage(name: users, page: () => const UserScreen()),



    //HRM

    GetPage(name: candidate, page: () => const CandidateScreen()),

    //setting
    GetPage(name: whatsappSetting, page: () => const WhatsappSetting()),
    GetPage(name: facebookSetting, page: () => const FacebookSetting()),


    //waste Tracking
    GetPage(name: pages, page: ()=> PolicyPagesScreen()),

    //General Setting
    GetPage(name: systemSetting, page: ()=> SystemSetting()),
    GetPage(name: paymentMethodSetting, page: ()=> SystemSetting()),
    GetPage(name: customerTypeSetting, page: ()=> SystemSetting()),
    GetPage(name: smsSetting, page: ()=> SystemSetting()),
    GetPage(name: bankSetting, page: ()=> SystemSetting()),
    GetPage(name: languageSetting, page: ()=> LanguageSetting()),


    GetPage(name: supportTicketCategory, page: ()=> SupportTicketCategoryScreen()),
    GetPage(name: supportTicket, page: ()=> SupportTicketScreen()),
    GetPage(name: newTicket, page: ()=> AddTicketScreen()),
    GetPage(name: ticketDetail, page: ()=> SupportConversationScreen(ticketId: Get.parameters['id']??"0")),


  ];
}
