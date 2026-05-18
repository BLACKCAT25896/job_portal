import 'dart:convert';
import 'package:job/common/controller/image_picker_controller.dart';
import 'package:job/common/controller/network_controller.dart';
import 'package:job/feature/candidate/controller/candidate_controller.dart';
import 'package:job/feature/candidate/domain/repository/candidate_repository.dart';
import 'package:job/feature/candidate_certificate/controller/candidate_certificate_controller.dart';
import 'package:job/feature/candidate_certificate/domain/repository/candidate_certificate_repository.dart';
import 'package:job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:job/feature/candidate_education/domain/repository/candidate_education_repository.dart';
import 'package:job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:job/feature/candidate_experience/domain/repository/candidate_experience_repository.dart';
import 'package:job/feature/candidate_links/controller/candidate_link_controller.dart';
import 'package:job/feature/candidate_links/domain/repository/candidate_link_repository.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_reference/controller/candidate_reference_controller.dart';
import 'package:job/feature/candidate_reference/domain/repository/candidate_reference_repository.dart';
import 'package:job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:job/feature/candidate_resume/domain/repository/candidate_resume_repository.dart';
import 'package:job/feature/candidate_training/controller/candidate_training_controller.dart';
import 'package:job/feature/candidate_training/domain/repository/candidate_training_repository.dart';
import 'package:job/feature/career_level/controller/career_level_controller.dart';
import 'package:job/feature/career_level/domain/repository/career_level_repository.dart';
import 'package:job/feature/company/controller/company_controller.dart';
import 'package:job/feature/company/domain/repository/company_repository.dart';
import 'package:job/feature/company_size/controller/company_size_controller.dart';
import 'package:job/feature/company_size/domain/repository/company_size_repository.dart';
import 'package:job/feature/contact_us/controller/contact_us_controller.dart';
import 'package:job/feature/contact_us/domain/repository/contact_us_repository.dart';
import 'package:job/feature/degree_level/controller/degree_level_controller.dart';
import 'package:job/feature/degree_level/domain/repository/degree_level_repository.dart';
import 'package:job/feature/favorite_company/controller/favorite_company_controller.dart';
import 'package:job/feature/favorite_company/domain/repository/favorite_company_repository.dart';
import 'package:job/feature/favorite_job/controller/favorite_job_controller.dart';
import 'package:job/feature/favorite_job/domain/repository/favorite_job_repository.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/domain/repository/frontend_repository.dart';
import 'package:job/feature/industries/controller/industry_controller.dart';
import 'package:job/feature/industries/domain/repository/industry_repository.dart';
import 'package:job/feature/inquiry/controller/inquiry_controller.dart';
import 'package:job/feature/inquiry/domain/repository/inquiry_repository.dart';
import 'package:job/feature/job_application/controller/job_application_controller.dart';
import 'package:job/feature/job_application/domain/repository/job_application_repository.dart';
import 'package:job/feature/job_category/controller/job_category_controller.dart';
import 'package:job/feature/job_category/domain/repository/job_category_repository.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/domain/repository/job_listing_repository.dart';
import 'package:job/feature/job_stage/controller/job_stage_controller.dart';
import 'package:job/feature/job_stage/domain/repository/job_stage_repository.dart';
import 'package:job/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:job/feature/ownership_type/domain/repository/ownership_type_repository.dart';
import 'package:flutter/services.dart';
import 'package:job/common/controller/route_controller.dart';
import 'package:job/common/widget/side_menu/src/side_bar_controller.dart';
import 'package:job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:job/feature/cms_management/cms_settings/domain/repository/system_settings_repository.dart';
import 'package:job/feature/cms_management/policy_pages/domain/repository/policy_pages_repository.dart';
import 'package:job/feature/cms_management/policy_pages/logic/pages_controller.dart';
import 'package:job/feature/package_plan/controller/package_controller.dart';
import 'package:job/feature/package_plan/domain/repository/package_repository.dart';
import 'package:job/feature/payment_method/domain/repository/payment_method_repository.dart';
import 'package:job/feature/payment_method/logic/payment_method_controller.dart';
import 'package:job/feature/post/controller/post_controller.dart';
import 'package:job/feature/post/domain/repository/post_repository.dart';
import 'package:job/feature/post_category/controller/post_category_controller.dart';
import 'package:job/feature/post_category/domain/repository/post_category_repository.dart';
import 'package:job/feature/post_comment/controller/post_comment_controller.dart';
import 'package:job/feature/post_comment/domain/repository/post_comment_repository.dart';
import 'package:job/feature/report_management/domain/repository/report_repository.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/feature/reported_job/controller/reported_job_controller.dart';
import 'package:job/feature/reported_job/domain/repository/reported_job_repository.dart';
import 'package:job/feature/role_and_permission/role/domain/repository/role_repository.dart';
import 'package:job/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:job/feature/role_and_permission/user/domain/repository/user_repository.dart';
import 'package:job/feature/salary_currency/controller/salary_currency_controller.dart';
import 'package:job/feature/salary_currency/domain/repository/salary_currency_repository.dart';
import 'package:job/feature/salary_period/controller/salary_period_controller.dart';
import 'package:job/feature/salary_period/domain/repository/salary_period_repository.dart';
import 'package:job/feature/setting/domain/repository/setting_repository.dart';
import 'package:job/feature/setting/logic/setting_controller.dart';
import 'package:job/feature/skill/controller/skill_controller.dart';
import 'package:job/feature/skill/domain/repository/skill_repository.dart';
import 'package:job/feature/transaction/controller/transaction_controller.dart';
import 'package:job/feature/transaction/domain/repository/transaction_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/common/controller/date_picker_controller.dart';
import 'package:job/common/controller/splash_controller.dart';
import 'package:job/common/controller/theme_controller.dart';
import 'package:job/common/controller/voice_note_controller.dart';
import 'package:job/common/repository/splash_repository.dart';
import 'package:job/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/dashboard/controller/dashboard_controller.dart';
import 'package:job/feature/notification/domain/repository/notification_repository.dart';
import 'package:job/feature/notification/logic/notification_controller.dart';
import 'package:job/feature/profile/domain/repository/profile_repository.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/role_and_permission/role/controller/role_controller.dart';
import 'package:job/feature/side_menu/side_menu_controller.dart';
import 'package:job/feature/subsscription/controller/subscription_controller.dart';
import 'package:job/feature/subsscription/domain/repository/subscription_repository.dart';
import 'package:job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:job/feature/support_ticket/domain/repositories/support_ticket_repository.dart';
import 'package:job/localization/language_model.dart';
import 'package:job/localization/localization_controller.dart';
import 'package:job/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {


  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: "${AppConstants.baseUrl}${AppConstants.versionPath}", sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() => SplashRepository(apiClient : Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => SidebarController(), fenix: true);
  Get.lazyPut(() => RouteController());
  Get.lazyPut(() => AuthenticationRepository(apiClient : Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProfileRepository(apiClient : Get.find()));
  Get.lazyPut(() => NotificationRepository(apiClient : Get.find()));
  Get.lazyPut(() => SubscriptionRepository(apiClient : Get.find()));
  Get.lazyPut(() => SupportTicketRepository(apiClient : Get.find()));


  //Here
  Get.lazyPut(() => IndustryRepository(apiClient: Get.find()));
  Get.lazyPut(() => IndustryController(industryRepository: Get.find()));

  Get.lazyPut(() => CompanySizeRepository(apiClient: Get.find()));
  Get.lazyPut(() => CompanySizeController(companySizeRepository: Get.find()));

  Get.lazyPut(() => OwnershipTypeRepository(apiClient: Get.find()));
  Get.lazyPut(() => OwnershipTypeController(ownershipTypeRepository: Get.find()));

  Get.lazyPut(() => CompanyRepository(apiClient: Get.find()));
  Get.lazyPut(() => CompanyController(companyRepository: Get.find()));

  Get.lazyPut(() => FavoriteCompanyRepository(apiClient: Get.find()));
  Get.lazyPut(() => FavoriteCompanyController(favoriteCompanyRepository: Get.find()));

  Get.lazyPut(() => CareerLevelRepository(apiClient: Get.find()));
  Get.lazyPut(() => CareerLevelController(careerLevelRepository: Get.find()));

  Get.lazyPut(() => DegreeLevelRepository(apiClient: Get.find()));
  Get.lazyPut(() => DegreeLevelController(degreeLevelRepository: Get.find()));

  Get.lazyPut(() => SalaryCurrencyRepository(apiClient: Get.find()));
  Get.lazyPut(() => SalaryCurrencyController(salaryCurrencyRepository: Get.find()));

  Get.lazyPut(() => SalaryPeriodRepository(apiClient: Get.find()));
  Get.lazyPut(() => SalaryPeriodController(salaryPeriodRepository: Get.find()));

  Get.lazyPut(() => SkillRepository(apiClient: Get.find()));
  Get.lazyPut(() => SkillController(skillRepository: Get.find()));

  Get.lazyPut(() => JobCategoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => JobCategoryController(jobCategoryRepository: Get.find()));

  Get.lazyPut(() => JobListingRepository(apiClient: Get.find()));
  Get.lazyPut(() => JobListingController(listingRepository: Get.find()));

  Get.lazyPut(() => JobStageRepository(apiClient: Get.find()));
  Get.lazyPut(() => JobStageController(stageRepository: Get.find()));

  Get.lazyPut(() => JobApplicationRepository(apiClient: Get.find()));
  Get.lazyPut(() => JobApplicationController(applicationRepository: Get.find()));

  Get.lazyPut(() => FavoriteJobRepository(apiClient: Get.find()));
  Get.lazyPut(() => FavoriteJobController(favoriteJobRepository: Get.find()));

  Get.lazyPut(() => CandidateEducationRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateEducationController(candidateEducationRepository: Get.find()));

  Get.lazyPut(() => CandidateCertificateRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateCertificateController(candidateCertificateRepository: Get.find()));

  Get.lazyPut(() => CandidateTrainingRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateTrainingController(candidateTrainingRepository: Get.find()));

  Get.lazyPut(() => CandidateExperienceRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateExperienceController(candidateExperienceRepository: Get.find()));

  Get.lazyPut(() => CandidateReferenceRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateReferenceController(candidateReferenceRepository: Get.find()));


  Get.lazyPut(() => CandidateLinkRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateLinkController(candidateLinkRepository: Get.find()));


  Get.lazyPut(() => CandidateResumeRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateResumeController(candidateResumeRepository: Get.find()));

  Get.lazyPut(() => ReportedJobRepository(apiClient: Get.find()));
  Get.lazyPut(() => ReportedJobController(reportedJobRepository: Get.find()));

  Get.lazyPut(() => InquiryRepository(apiClient: Get.find()));
  Get.lazyPut(() => InquiryController(inquiryRepository: Get.find()));

  Get.lazyPut(() => PostCategoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => PostCategoryController(postCategoryRepository: Get.find()));

  Get.lazyPut(() => ReportRepository(apiClient: Get.find()));
  Get.lazyPut(() => ReportController(reportRepository: Get.find()));

  Get.lazyPut(() => PostRepository(apiClient: Get.find()));
  Get.lazyPut(() => PostController(postRepository: Get.find()));

  Get.lazyPut(() => PostCommentRepository(apiClient: Get.find()));
  Get.lazyPut(() => PostCommentController(postCommentRepository: Get.find()));

  Get.lazyPut(() => TransactionRepository(apiClient: Get.find()));
  Get.lazyPut(() => TransactionController(transactionRepository: Get.find()));
  Get.lazyPut(() => SystemSettingsRepository(apiClient: Get.find()));
  Get.lazyPut(() => SystemSettingsController(systemSettingsRepository: Get.find()));
  Get.lazyPut(() => ImagePickerController());


  Get.lazyPut(() => RoleRepository(apiClient: Get.find()));
  Get.lazyPut(() => RoleController(roleRepository: Get.find()));
  Get.lazyPut(() => UserRepository(apiClient: Get.find()));
  Get.lazyPut(() => UserController(userRepository: Get.find()));

  // Controller
  Get.lazyPut(() => SideBarController());
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthenticationController(authenticationRepository: Get.find()));
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => RoleController(roleRepository: Get.find()));
  Get.lazyPut(() => ProfileController(profileRepository: Get.find()));
  Get.lazyPut(() => NotificationController(notificationRepository: Get.find()));
  Get.lazyPut(() => SubscriptionController(subscriptionRepository: Get.find()));
  Get.lazyPut(() => DatePickerController());
  Get.lazyPut(() => SupportTicketController(supportTicketRepository: Get.find()));
  Get.lazyPut(() => VoiceNoteController());
  Get.lazyPut(() => NetworkController());



  Get.lazyPut(() => PaymentMethodRepository(apiClient: Get.find()));
  Get.lazyPut(() => PaymentMethodController(paymentMethodRepository: Get.find()));



  Get.lazyPut(() => CandidateRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateController(candidateRepository: Get.find()));

  Get.lazyPut(() => PagesRepository(apiClient: Get.find()));
  Get.lazyPut(() => PagesController(pagesRepository: Get.find()));

  Get.lazyPut(() => SettingRepository(apiClient: Get.find()));
  Get.lazyPut(() => SettingController(settingRepository: Get.find()));

  Get.lazyPut(() => LandingRepository(apiClient: Get.find()));
  Get.lazyPut(() => LandingPageController(landingRepository: Get.find()));

  Get.lazyPut(() => ContactUsRepository(apiClient: Get.find()));
  Get.lazyPut(() => ContactUsController(contactUsRepository: Get.find()));


  Get.lazyPut(() => PackageRepository(apiClient: Get.find()));
  Get.lazyPut(() => PackageController(packageRepository: Get.find()));
  Get.lazyPut(() => CandidatePanelController());




  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> languageJson = {};
    mappedJson.forEach((key, value) {
      languageJson[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = languageJson;
  }
  return languages;
}
