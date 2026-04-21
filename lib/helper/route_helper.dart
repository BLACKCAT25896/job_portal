

import 'package:mighty_job/feature/candidate/presentation/screens/candidate_screen.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/candidate_education/presentation/screens/candidate_education_screen.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/screens/candidate_experience_screen.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/screens/candidate_resume_screen.dart';
import 'package:mighty_job/feature/career_level/presentation/screens/career_level_screen.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/screens/system_setting_screen.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/presentation/screens/policy_pages_screen.dart';
import 'package:mighty_job/feature/authentication/presentation/screen/delete_account_screen.dart';
import 'package:mighty_job/feature/authentication/presentation/screen/login_screen.dart';
import 'package:mighty_job/feature/company/presentation/screens/company_screen.dart';
import 'package:mighty_job/feature/company_size/presentation/screens/company_size_screen.dart';
import 'package:mighty_job/feature/dashboard/views/dashboard_screen.dart';
import 'package:mighty_job/feature/degree_level/presentation/screens/degree_level_screen.dart';
import 'package:mighty_job/feature/favorite_company/presentation/screens/favorite_company_screen.dart';
import 'package:mighty_job/feature/frontend/policy_enum.dart';
import 'package:mighty_job/feature/frontend/presentation/screens/category_wise_job_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/screens/job_details_screen.dart';
import 'package:mighty_job/feature/frontend/presentation/screens/landing_screen.dart';
import 'package:mighty_job/feature/frontend/presentation/screens/policy_screen.dart';
import 'package:mighty_job/feature/industries/presentation/screens/industry_screen.dart';
import 'package:mighty_job/feature/inquiry/presentation/screens/inquiry_screen.dart';
import 'package:mighty_job/feature/job_application/presentation/screens/job_application_screen.dart';
import 'package:mighty_job/feature/job_category/presentation/screens/job_category_screen.dart';
import 'package:mighty_job/feature/job_listing/presentation/screens/job_listing_screen.dart';
import 'package:mighty_job/feature/job_stage/presentation/screens/job_stage_screen.dart';
import 'package:mighty_job/feature/notification/presentation/screens/notification_screen.dart';
import 'package:mighty_job/feature/ownership_type/presentation/screens/ownership_type_screen.dart';
import 'package:mighty_job/feature/payment_method/presentation/screens/payment_method_screen.dart';
import 'package:mighty_job/feature/post/presentation/screens/post_screen.dart';
import 'package:mighty_job/feature/post_category/presentation/screens/post_category_screen.dart';
import 'package:mighty_job/feature/post_comment/presentation/screens/post_comment_screen.dart';
import 'package:mighty_job/feature/profile/presentation/screens/profile_screen.dart';
import 'package:mighty_job/feature/reported_job/presentation/screens/reported_job_screen.dart';
import 'package:mighty_job/feature/role_and_permission/role/presentation/screens/role_screen.dart';
import 'package:mighty_job/feature/role_and_permission/user/presentation/screens/user_screen.dart';
import 'package:mighty_job/feature/salary_currency/presentation/screens/salary_currency_screen.dart';
import 'package:mighty_job/feature/salary_period/presentation/screens/salary_period_screen.dart';
import 'package:mighty_job/feature/setting/presentation/widgets/language_setting.dart';
import 'package:mighty_job/feature/setting/presentation/widgets/system_setting.dart';
import 'package:mighty_job/feature/skill/presentation/screens/skill_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/add_ticket_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/support_conversation_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/support_ticket_screen.dart';
import 'package:mighty_job/feature/support_ticket/screens/ticket_category_screen.dart';
import 'package:mighty_job/feature/transaction/presentation/screens/transaction_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static String getInitialRoute() => initial;

  static const String signIn = '/admin/login';
  static String getSignInRoute() => signIn;


  static const String login = '/login';
  static String getLoginRoute() => login;


  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerify = '/otp-verify';
  static const String resetPassword = '/reset-password';

  static const String dashboard = '/dashboard';
  static String getDashboardRoute() => dashboard;

  static const String industry = '/industry';
  static String getIndustryRoute() => industry;

  static const String companySize = '/company-size';
  static String getCompanySizeRoute() => companySize;

  static const String ownershipType = '/ownership-type';
  static String getOwnershipTypeRoute() => ownershipType;

  static const String company = '/company';
  static String getCompanyRoute() => company;

  static const String favoriteCompany = '/favorite-company';
  static String getFavoriteCompanyRoute() => favoriteCompany;


  static const String careerLevel = '/career-level';
  static String getCareerLevelRoute() => careerLevel;

  static const String degreeLevel = '/degree-level';
  static String getDegreeLevelRoute() => degreeLevel;

  static const String salaryCurrency = '/salary-currency';
  static String getSalaryCurrencyRoute() => salaryCurrency;

  static const String salaryPeriod = '/salary-period';
  static String getSalaryPeriodRoute() => salaryPeriod;

  static const String skill = '/skill';
  static String getSkillRoute() => skill;

  static const String jobCategories = '/job-categories';
  static String getJobCategoryRoute() => jobCategories;

  static const String jobListing = '/job-listing';
  static String getJobListingRoute() => jobListing;

  static const String jobStage = '/job-stage';
  static String getJobStageRoute() => jobStage;

  static const String jobApplication = '/job-application';
  static String getJobApplicationRoute() => jobApplication;

  static const String reportedJob = '/reported-job';
  static String getReportedJobRoute() => reportedJob;

  static const String favoriteJob = '/favorite-job';
  static String getFavoriteJobRoute() => favoriteJob;

  static const String inquiry = '/inquiry';
  static String getInquiryRoute() => inquiry;

  static const String postCategory = '/post-category';
  static String getPostCategoryRoute() => postCategory;

  static const String post = '/post';
  static String getPostRoute() => post;

  static const String postComment = '/post-comment';
  static String getPostCommentRoute() => postComment;

  static const String transaction = '/transaction';
  static String getTransactionRoute() => transaction;

  static const String notification = '/notification';
  static String getNotificationRoute() => notification;

  static const String profile = '/profile';
  static String getProfileRoute() => profile;



  static const String policyPages = '/policy-pages';
  static String getPolicyPagesRoute() => policyPages;

  static const String websiteSetting = '/website-setting';
  static String getWebsiteSettingRoute() => websiteSetting;


  static const String deleteAccount = '/delete-account';
  static String getDeleteAccountRoute() => deleteAccount;

  static const String paymentMethod = '/payment-method';
  static String getPaymentMethodRoute() => paymentMethod;


  static const String candidate = '/candidate';
  static String getCandidateRoute() => candidate;

  static const String candidateEducation = '/candidate-education';
  static String getCandidateEducationRoute() => candidateEducation;

  static const String candidateExperience = '/candidate-experience';
  static String getCandidateExperienceRoute() => candidateExperience;

  static const String candidateResume = '/candidate-resume';
  static String getCandidateResumeRoute() => candidateResume;

  static const String roles = '/roles';
  static String getRolesRoute() => roles;

  static const String users = '/users';
  static String getUsersRoute() => users;


  static const String pages = '/pages';
  static String getPagesRoute() => pages;

  static const String systemSetting = '/system-setting';
  static String getSystemSettingRoute() => systemSetting;

  static const String paymentMethodSetting = '/payment-method-setting';
  static String getPaymentMethodSettingRoute() => paymentMethodSetting;

  static const String customerTypeSetting = '/customer-type-setting';
  static String getCustomerTypeSettingRoute() => customerTypeSetting;


  static const String smsSetting = '/sms-setting';
  static String getSmsSettingRoute() => smsSetting;


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




  static const String policy = '/policy/:type';
  static String getPolicyRoute(PolicyEnum type) => '/policy/${toSeoPath(type)}';


  static const String categoryWiseJob = '/category-wise-job';
  static String getCategoryWiseJobRoute({required String slug, required String type}) => "$categoryWiseJob?type=$type&slug=$slug";

  static const String jobDetails = '/job-detail';
  static String getJobDetailRoute(String slug) => "$jobDetails?id=$slug";



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const LandingScreen()),
    GetPage(name: signIn, page: () => const LoginScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: deleteAccount, page: () => const DeleteAccountScreen()),
    GetPage(name: notification, page: () => const NotificationScreen()),



    //cms
    GetPage(name: websiteSetting, page: () => const SystemSettingScreen()),


    GetPage(name: paymentMethod, page: () => const PaymentMethodScreen()),
    GetPage(name: roles, page: () => const RoleManagementScreen()),
    GetPage(name: users, page: () => const UserScreen()),
    GetPage(name: pages, page: ()=> PolicyPagesScreen()),

    //General Setting
    GetPage(name: systemSetting, page: ()=> SystemSetting()),
    GetPage(name: paymentMethodSetting, page: ()=> SystemSetting()),
    GetPage(name: customerTypeSetting, page: ()=> SystemSetting()),
    GetPage(name: smsSetting, page: ()=> SystemSetting()),
    GetPage(name: languageSetting, page: ()=> LanguageSetting()),

    GetPage(name: industry, page: ()=> IndustryScreen()),
    GetPage(name: companySize, page: ()=> CompanySizeScreen()),
    GetPage(name: ownershipType, page: ()=> OwnershipTypeScreen()),
    GetPage(name: company, page: ()=> CompanyScreen()),
    GetPage(name: favoriteCompany, page: ()=> FavoriteCompanyScreen()),
    GetPage(name: careerLevel, page: ()=> CareerLevelScreen()),
    GetPage(name: degreeLevel, page: ()=> DegreeLevelScreen()),
    GetPage(name: salaryCurrency, page: ()=> SalaryCurrencyScreen()),
    GetPage(name: salaryPeriod, page: ()=> SalaryPeriodScreen()),
    GetPage(name: skill, page: ()=> SkillScreen()),
    GetPage(name: jobCategories, page: ()=> JobCategoryScreen()),
    GetPage(name: jobListing, page: ()=> JobListingScreen()),
    GetPage(name: jobStage, page: ()=> JobStageScreen()),
    GetPage(name: jobApplication, page: ()=> JobApplicationScreen()),
    GetPage(name: reportedJob, page: ()=> const ReportedJobScreen()),

    GetPage(name: candidate, page: () => const CandidateScreen()),
    GetPage(name: candidateEducation, page: () => const CandidateEducationScreen()),
    GetPage(name: candidateExperience, page: () => const CandidateExperienceScreen()),
    GetPage(name: candidateResume, page: () => const CandidateResumeScreen()),

    GetPage(name: postCategory, page: ()=> PostCategoryScreen()),
    GetPage(name: post, page: ()=> PostScreen()),
    GetPage(name: postComment, page: ()=> PostCommentScreen()),
    GetPage(name: transaction, page: ()=> TransactionScreen()),
    GetPage(name: inquiry, page: ()=> InquiryScreen()),

    GetPage(name: supportTicketCategory, page: ()=> SupportTicketCategoryScreen()),
    GetPage(name: supportTicket, page: ()=> SupportTicketScreen()),
    GetPage(name: newTicket, page: ()=> AddTicketScreen()),
    GetPage(name: ticketDetail, page: ()=> SupportConversationScreen(ticketId: Get.parameters['id']??"0")),

    GetPage(name: categoryWiseJob, page: ()=> CategoryOrIndustryWiseJobListWidget(
        type: Get.parameters['type']??'',
        slug: Get.parameters['slug']??"")),

    GetPage(name: jobDetails, page: ()=> JobDetailsScreen(slug: Get.parameters['slug']??"")),


    GetPage(name: policy, page: () {
      final typeParam = Get.parameters['type'];
      final policyType = PolicyEnum.values.firstWhere((e) => toSeoPath(e) == typeParam,
        orElse: () => PolicyEnum.termsOfService,
      );
      return PolicyScreen(policyType: policyType);
    },
    ),

  ];
}
String toSeoPath(PolicyEnum type) {
  switch (type) {
    case PolicyEnum.termsOfService:
      return 'terms-of-service';
    case PolicyEnum.privacyPolicy:
      return 'privacy-policy';
    case PolicyEnum.cookiePolicy:
      return 'cookie-policy';
    case PolicyEnum.aboutUs:
      return 'about-us';
  }
}