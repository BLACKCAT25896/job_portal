import 'dart:convert';
import 'package:ecommerce/common/controller/image_picker_controller.dart';
import 'package:ecommerce/common/controller/network_controller.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/repository/auction_repository.dart';
import 'package:ecommerce/feature/auction_management/auction/logic/auction_controller.dart';
import 'package:ecommerce/feature/cart/domain/repository/cart_repository.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/repository/attribute_repository.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/repository/attribute_value_repository.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/brand/domain/repository/brand_repository.dart';
import 'package:ecommerce/feature/inventory/category/controller/category_controller.dart';
import 'package:ecommerce/feature/inventory/category/domain/repository/category_repository.dart';
import 'package:ecommerce/feature/inventory/damage/controller/damage_controller.dart';
import 'package:ecommerce/feature/inventory/damage/domain/repository/damage_repository.dart';
import 'package:ecommerce/feature/inventory/product/domain/repository/product_repository.dart';
import 'package:ecommerce/feature/inventory/product/domain/repository/search_product_repository.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/logic/search_product_controller.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/domain/repository/unit_repository.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:ecommerce/feature/inventory/warehouse/domain/repository/warehouse_repository.dart';
import 'package:ecommerce/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:ecommerce/feature/order_management/order_status/domain/repository/order_status_repository.dart';
import 'package:ecommerce/feature/order_management/order_status/logic/order_status_controller.dart';
import 'package:ecommerce/feature/order_management/order_type/domain/repository/order_type_repository.dart';
import 'package:ecommerce/feature/order_management/order_type/logic/order_type_controller.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/common/controller/route_controller.dart';
import 'package:ecommerce/common/widget/side_menu/src/side_bar_controller.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/repository/account_repository.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/repository/deposit_repository.dart';
import 'package:ecommerce/feature/account_management/deposit/logic/deposit_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/repository/deposit_category_repository.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/feature/account_management/expense/domain/repository/expense_repository.dart';
import 'package:ecommerce/feature/account_management/expense/logic/expense_controller.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/repository/expense_category_repository.dart';
import 'package:ecommerce/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:ecommerce/feature/account_management/fund/domain/repository/fund_repository.dart';
import 'package:ecommerce/feature/account_management/fund/logic/fund_controller.dart';
import 'package:ecommerce/feature/cms_management/about_us/domain/repository/about_us_repository.dart';
import 'package:ecommerce/feature/cms_management/about_us/logic/about_us_controller.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/domain/repository/system_settings_repository.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/domain/repository/policy_pages_repository.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/logic/pages_controller.dart';
import 'package:ecommerce/feature/cms_management/explore/domain/repository/explore_repository.dart';
import 'package:ecommerce/feature/cms_management/explore/logic/explore_controller.dart';
import 'package:ecommerce/feature/cms_management/why_choose/domain/repository/why_choose_repository.dart';
import 'package:ecommerce/feature/cms_management/why_choose/logic/why_choose_controller.dart';
import 'package:ecommerce/feature/human_resource/attendance/controller/attendance_controller.dart';
import 'package:ecommerce/feature/human_resource/attendance/domain/repository/attendance_repository.dart';
import 'package:ecommerce/feature/human_resource/award/controller/award_controller.dart';
import 'package:ecommerce/feature/human_resource/award/domain/repository/award_repository.dart';
import 'package:ecommerce/feature/human_resource/candidate/controller/candidate_controller.dart';
import 'package:ecommerce/feature/human_resource/candidate/domain/repository/candidate_repository.dart';
import 'package:ecommerce/feature/human_resource/department/controller/department_controller.dart';
import 'package:ecommerce/feature/human_resource/department/domain/repository/department_repository.dart';
import 'package:ecommerce/feature/human_resource/designation/controller/designation_controller.dart';
import 'package:ecommerce/feature/human_resource/designation/domain/repository/designation_repository.dart';
import 'package:ecommerce/feature/human_resource/interview/controller/interview_controller.dart';
import 'package:ecommerce/feature/human_resource/interview/domain/repository/interview_repository.dart';
import 'package:ecommerce/feature/human_resource/leave_application/controller/leave_application_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_application/domain/repository/leave_application_repository.dart';
import 'package:ecommerce/feature/human_resource/leave_type/controller/leave_type_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_type/domain/repository/leave_type_repository.dart';
import 'package:ecommerce/feature/human_resource/loan/controller/loan_controller.dart';
import 'package:ecommerce/feature/human_resource/loan/domain/repository/loan_repository.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/controller/loan_installment_controller.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/repository/loan_installment_repository.dart';
import 'package:ecommerce/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:ecommerce/feature/human_resource/recruitment/domain/repository/recruitment_repository.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/controller/salary_generate_controller.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/repository/salary_generate_repository.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/domain/repository/salary_setup_repository.dart';
import 'package:ecommerce/feature/human_resource/salary_type/controller/salary_type_controller.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/repository/salary_type_repository.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/controller/weekly_holiday_controller.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/domain/repository/weekly_holiday_repository.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point/domain/repository/loyalty_point_repository.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point/logic/loyalty_point_controller.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/repository/loyalty_point_redemption_repository.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/logic/loyalty_point_redemption_controller.dart';
import 'package:ecommerce/feature/order_management/order/domain/repository/order_repository.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/payment_method/domain/repository/payment_method_repository.dart';
import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/repository/customer_repository.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/domain/repository/pos_repository.dart';
import 'package:ecommerce/feature/pos_management/pos/logic/pos_controller.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/repository/purchase_repository.dart';
import 'package:ecommerce/feature/purchase_management/purchase/logic/purchase_controller.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/repository/purchase_returns_repository.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/logic/purchase_returns_controller.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/repository/supplier_repository.dart';
import 'package:ecommerce/feature/purchase_management/supplier/logic/supplier_controller.dart';
import 'package:ecommerce/feature/report_management/domain/repository/report_repository.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/repository/role_repository.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/repository/user_repository.dart';
import 'package:ecommerce/feature/setting/domain/repository/setting_repository.dart';
import 'package:ecommerce/feature/setting/logic/setting_controller.dart';
import 'package:ecommerce/feature/tax_management/tax/domain/repository/tax_repository.dart';
import 'package:ecommerce/feature/tax_management/tax/logic/tax_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/controller/splash_controller.dart';
import 'package:ecommerce/common/controller/theme_controller.dart';
import 'package:ecommerce/common/controller/voice_note_controller.dart';
import 'package:ecommerce/common/repository/splash_repository.dart';
import 'package:ecommerce/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:ecommerce/feature/authentication/logic/authentication_controller.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/notification/domain/repository/notification_repository.dart';
import 'package:ecommerce/feature/notification/logic/notification_controller.dart';
import 'package:ecommerce/feature/profile/domain/repository/profile_repository.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/feature/role_and_permission/role/controller/role_controller.dart';
import 'package:ecommerce/feature/side_menu/side_menu_controller.dart';
import 'package:ecommerce/feature/subsscription/controller/subscription_controller.dart';
import 'package:ecommerce/feature/subsscription/domain/repository/subscription_repository.dart';
import 'package:ecommerce/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:ecommerce/feature/support_ticket/domain/repositories/support_ticket_repository.dart';
import 'package:ecommerce/localization/language_model.dart';
import 'package:ecommerce/localization/localization_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/feature/cms_management/banner/domain/repository/banner_repository.dart';
import 'package:ecommerce/feature/cms_management/banner/logic/banner_controller.dart';
import 'package:ecommerce/feature/cms_management/faq/domain/repository/faq_repository.dart';
import 'package:ecommerce/feature/cms_management/faq/logic/faq_controller.dart';
import 'package:ecommerce/feature/cms_management/feedback/domain/repository/feedback_repository.dart';
import 'package:ecommerce/feature/cms_management/feedback/logic/feedback_controller.dart';
import '../feature/human_resource/salary_setup/controller/salary_setup_controller.dart';

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


  Get.lazyPut(() => BannerRepository(apiClient: Get.find()));
  Get.lazyPut(() => AboutUsRepository(apiClient: Get.find()));
  Get.lazyPut(() => ExploreRepository(apiClient: Get.find()));
  Get.lazyPut(() => WhyChooseRepository(apiClient: Get.find()));
  Get.lazyPut(() => FaqRepository(apiClient: Get.find()));
  Get.lazyPut(() => FeedbackRepository(apiClient: Get.find()));
  Get.lazyPut(() => SystemSettingsRepository(apiClient: Get.find()));

  Get.lazyPut(() => BannerController(bannerRepository: Get.find()));
  Get.lazyPut(() => AboutUsController(aboutUsRepository: Get.find()));
  Get.lazyPut(() => ExploreController(benefitRepository: Get.find()));
  Get.lazyPut(() => WhyChooseController(whyChooseUsRepository: Get.find()));
  Get.lazyPut(() => FaqController(faqRepository: Get.find()));
  Get.lazyPut(() => FeedbackController(feedbackRepository: Get.find()));
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


  // ecommerce management
  Get.lazyPut(() => OrderRepository(apiClient: Get.find()));
  Get.lazyPut(() => OrderController(orderRepository: Get.find()));


  Get.lazyPut(() => OrderStatusRepository(apiClient: Get.find()));
  Get.lazyPut(() => OrderStatusController(orderStatusRepository: Get.find()));

  Get.lazyPut(() => OrderTypeRepository(apiClient: Get.find()));
  Get.lazyPut(() => OrderTypeController(orderTypeRepository: Get.find()));



  Get.lazyPut(() => PosRepository(apiClient: Get.find()));
  Get.lazyPut(() => PosController(foodRepository: Get.find()));

  Get.lazyPut(() => PurchaseRepository(apiClient: Get.find()));
  Get.lazyPut(() => PurchaseController(purchaseRepository: Get.find()));
  Get.lazyPut(() => PurchaseReturnRepository(apiClient: Get.find()));
  Get.lazyPut(() => PurchaseReturnController(purchaseReturnRepository: Get.find()));
  Get.lazyPut(() => SupplierRepository(apiClient: Get.find()));
  Get.lazyPut(() => SupplierController(supplierRepository: Get.find()));

  Get.lazyPut(() => PaymentMethodRepository(apiClient: Get.find()));
  Get.lazyPut(() => PaymentMethodController(paymentMethodRepository: Get.find()));

  Get.lazyPut(() => CustomerRepository(apiClient: Get.find()));
  Get.lazyPut(() => CustomerController(customerRepository  : Get.find()));


  Get.lazyPut(() => ReportRepository(apiClient: Get.find()));
  Get.lazyPut(() => ReportController(reportRepository  : Get.find()));



  Get.lazyPut(() => CartRepository(apiClient : Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));

  //HRM
  Get.lazyPut(() => DepartmentRepository(apiClient : Get.find()));
  Get.lazyPut(() => DepartmentController(departmentRepository: Get.find()));
  Get.lazyPut(() => DesignationRepository(apiClient : Get.find()));
  Get.lazyPut(() => DesignationController(designationRepository: Get.find()));
  Get.lazyPut(() => LoanRepository(apiClient : Get.find()));
  Get.lazyPut(() => LoanController(loanRepository: Get.find()));
  Get.lazyPut(() => WeeklyHolidayRepository(apiClient : Get.find()));
  Get.lazyPut(() => WeeklyHolidayController(weeklyHolidayRepository: Get.find()));
  Get.lazyPut(() => AttendanceRepository(apiClient: Get.find()));
  Get.lazyPut(() => AttendanceController(attendanceRepository: Get.find()));
  Get.lazyPut(() => AwardRepository(apiClient: Get.find()));
  Get.lazyPut(() => AwardController(awardRepository: Get.find()));
  Get.lazyPut(() => CandidateRepository(apiClient: Get.find()));
  Get.lazyPut(() => CandidateController(candidateRepository: Get.find()));
  Get.lazyPut(() => InterviewRepository(apiClient: Get.find()));
  Get.lazyPut(() => InterviewController(interviewRepository: Get.find()));
  Get.lazyPut(() => LeaveApplicationRepository(apiClient: Get.find()));
  Get.lazyPut(() => LeaveApplicationController(leaveApplicationRepository: Get.find()));
  Get.lazyPut(() => LeaveTypeRepository(apiClient: Get.find()));
  Get.lazyPut(() => LeaveTypeController(leaveTypeRepository: Get.find()));
  Get.lazyPut(() => LoanInstallmentRepository(apiClient: Get.find()));
  Get.lazyPut(() => LoanInstallmentController(loanInstallmentRepository: Get.find()));
  Get.lazyPut(() => RecruitmentRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecruitmentController(recruitmentRepository: Get.find()));
  Get.lazyPut(() => SalaryGenerateRepository(apiClient: Get.find()));
  Get.lazyPut(() => SalaryGenerateController(salaryGenerateRepository: Get.find()));
  Get.lazyPut(() => SalarySetupRepository(apiClient: Get.find()));
  Get.lazyPut(() => SalarySetupController(salarySetupRepository: Get.find()));
  Get.lazyPut(() => SalaryTypeRepository(apiClient: Get.find()));
  Get.lazyPut(() => SalaryTypeController(salaryTypeRepository: Get.find()));


  //Accounting
  Get.lazyPut(() => AccountRepository(apiClient: Get.find()));
  Get.lazyPut(() => AccountController(accountRepository: Get.find()));

  Get.lazyPut(() => DepositCategoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => DepositCategoryController(depositCategoryRepository: Get.find()));

  Get.lazyPut(() => DepositRepository(apiClient: Get.find()));
  Get.lazyPut(() => DepositController(depositRepository: Get.find()));


  Get.lazyPut(() => ExpanseCategoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => ExpanseCategoryController(expanseCategoryRepository: Get.find()));

  Get.lazyPut(() => ExpenseRepository(apiClient: Get.find()));
  Get.lazyPut(() => ExpenseController(expenseRepository: Get.find()));

  Get.lazyPut(() => FundRepository(apiClient: Get.find()));
  Get.lazyPut(() => FundController(fundRepository: Get.find()));

  Get.lazyPut(() => LoyaltyPointRepository(apiClient: Get.find()));
  Get.lazyPut(() => LoyaltyPointController(loyaltyPointRepository: Get.find()));

  Get.lazyPut(() => LoyaltyPointRedemptionRepository(apiClient: Get.find()));
  Get.lazyPut(() => LoyaltyPointRedemptionController(loyaltyPointRedemptionRepository: Get.find()));


  Get.lazyPut(() => PagesRepository(apiClient: Get.find()));
  Get.lazyPut(() => PagesController(pagesRepository: Get.find()));

  Get.lazyPut(() => SettingRepository(apiClient: Get.find()));
  Get.lazyPut(() => SettingController(settingRepository: Get.find()));


  Get.lazyPut(() => TaxRepository(apiClient: Get.find()));
  Get.lazyPut(() => TaxController(taxRepository: Get.find()));



  //Inventory

  Get.lazyPut(() => CategoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));

  Get.lazyPut(() => BrandRepository(apiClient: Get.find()));
  Get.lazyPut(() => BrandController(brandRepository: Get.find()));

  Get.lazyPut(() => UnitRepository(apiClient: Get.find()));
  Get.lazyPut(() => UnitController(unitRepository: Get.find()));

  Get.lazyPut(() => DamageRepository(apiClient: Get.find()));
  Get.lazyPut(() => DamageController(damageRepository: Get.find()));

  Get.lazyPut(() => AttributeRepository(apiClient: Get.find()));
  Get.lazyPut(() => AttributeController(attributeRepository: Get.find()));

  Get.lazyPut(() => AttributeValueRepository(apiClient: Get.find()));
  Get.lazyPut(() => AttributeValueController(attributeValueRepository: Get.find()));


  Get.lazyPut(() => ProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => ProductController(productRepository: Get.find()));

  Get.lazyPut(() => SearchProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => SearchProductController(searchProductRepository: Get.find()));


  Get.lazyPut(() => WarehouseRepository(apiClient: Get.find()));
  Get.lazyPut(() => WarehouseController(warehouseRepository: Get.find()));

  Get.lazyPut(() => AuctionRepository(apiClient: Get.find()));
  Get.lazyPut(() => AuctionController(auctionRepository: Get.find()));




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
